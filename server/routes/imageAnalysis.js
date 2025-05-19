// server/routes/imageAnalysis.js
const express = require('express');
const router = express.Router();
const axios = require('axios');

router.post('/analyze', async (req, res) => {
  try {
    const { imageBase64 } = req.body;
    
    if (!imageBase64) {
      return res.status(400).json({ error: 'No image provided' });
    }
    
    // Call Open Router API for image analysis
    const response = await axios.post(
      'https://openrouter.ai/api/v1/chat/completions',
      {
        model: 'qwen/qwen2.5-vl-32b-instruct:free',
        messages: [
          {
            role: 'user',
            content: [
              {
                type: 'text',
                text: 'Identify all grocery items in this image. For each item, provide the name, estimated quantity, and category.'
              },
              {
                type: 'image_url',
                image_url: {
                  url: imageBase64
                }
              }
            ]
          }
        ]
      },
      {
        headers: {
          'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY || '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'}`,
          'Content-Type': 'application/json'
        }
      }
    );
    
    // Process the LLM response to extract items
    const identifiedItems = response.data.choices[0].message.content;
    
    // Now check if these items are in our database
    const itemsList = parseItemsFromLLMResponse(identifiedItems);
    const availableItems = await checkItemsAvailability(req.db, itemsList);
    
    res.json(availableItems);
  } catch (error) {
    console.error('Error analyzing image:', error);
    res.status(500).json({ error: 'Failed to analyze image' });
  }
});

// Helper function to parse items from LLM response
function parseItemsFromLLMResponse(response) {
  // This is a simplified example - actual implementation would depend on response format
  // In a real implementation, you'd need to parse the text response from the LLM
  
  // Example implementation assuming the LLM returns a text list of items
  const lines = response.split('\n');
  const items = [];
  
  for (const line of lines) {
    const match = line.match(/([\w\s]+)[\s-]+(\d+)/);
    if (match) {
      items.push({
        name: match[1].trim(),
        quantity: parseInt(match[2]) || 1
      });
    }
  }
  
  return items;
}

// Check if items are available in database
async function checkItemsAvailability(db, items) {
  const result = [];
  
  for (const item of items) {
    try {
      // Search for similar product names
      const dbResult = await db.query(
        'SELECT * FROM products WHERE name ILIKE $1 LIMIT 1',
        [`%${item.name}%`]
      );
      
      if (dbResult.rows.length > 0) {
        const product = dbResult.rows[0];
        result.push({
          id: product.id,
          name: product.name,
          price: product.price,
          mrp: product.mrp,
          imageUrl: product.image_url,
          quantity: product.quantity,
          inStock: product.inventory_count > 0
        });
      } else {
        // Product not found in database
        result.push({
          name: item.name,
          inStock: false,
          price: 0
        });
      }
    } catch (error) {
      console.error(`Error checking availability for ${item.name}:`, error);
    }
  }
  
  return result;
}

module.exports = router;
