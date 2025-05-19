const express = require('express');
const router = express.Router();

// Get all products
router.get('/', async (req, res) => {
  try {
    const result = await req.db.query('SELECT * FROM products');
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching products:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

router.get('/category/:categoryId', async (req, res) => {
  try {
    const { categoryId } = req.params;
    const limit = req.query.limit ? parseInt(req.query.limit) : null;
    
    let query = 'SELECT * FROM products WHERE category_id = $1';
    let params = [categoryId];
    
    if (limit) {
      query += ' LIMIT $2';
      params.push(limit);
    }
    
    const result = await req.db.query(query, params);
    
    // Log the first product to verify fields
    if (result.rows.length > 0) {
      console.log('Sample product from database:', result.rows[0]);
    }
    
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching products by category:', error);
    res.status(500).json({ error: 'Server error' });
  }
});
// Get product details with enhanced information
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    // Get basic product details
    const productResult = await req.db.query(
      'SELECT p.*, c.name as category_name FROM products p ' +
      'LEFT JOIN categories c ON p.category_id = c.id ' +
      'WHERE p.id = $1',
      [id]
    );
    
    if (productResult.rows.length === 0) {
      return res.status(404).json({ error: 'Product not found' });
    }
    
    // Return the product with category name included
    res.json(productResult.rows[0]);
  } catch (error) {
    console.error('Error fetching product:', error);
    res.status(500).json({ error: 'Server error' });
  }
});
// Search products

// Search products
router.get('/search/:query', async (req, res) => {
  try {
    const { query } = req.params;
    
    // Use ILIKE for case-insensitive search with partial matching
    const result = await req.db.query(
      `SELECT * FROM products 
       WHERE name ILIKE $1 
       OR description ILIKE $1
       OR quantity ILIKE $1
       ORDER BY 
         CASE WHEN name ILIKE $2 THEN 0 ELSE 1 END, 
         name ASC`,
      [`%${query}%`, `${query}%`] // %query% finds it anywhere, query% prioritizes matches at start
    );
    
    res.json(result.rows);
  } catch (error) {
    console.error('Error searching products:', error);
    res.status(500).json({ error: 'Server error' });
  }
});
router.post('/check-availability', async (req, res) => {
  try {
    const { detectedItems } = req.body;
    
    if (!detectedItems || !Array.isArray(detectedItems)) {
      return res.status(400).json({ error: 'Invalid request: detectedItems must be an array' });
    }
    
    const result = [];
    
    for (const item of detectedItems) {
      const name = item.name ? item.name.toLowerCase() : '';
      
      // Try to find a matching product in the database using ILIKE for fuzzy matching
      const query = `
        SELECT 
          p.*, 
          c.name as category_name 
        FROM 
          products p
        LEFT JOIN 
          categories c ON p.category_id = c.id
        WHERE 
          LOWER(p.name) ILIKE $1 
          OR LOWER(p.name) ILIKE $2 
          OR LOWER(p.name) ILIKE $3
        LIMIT 1
      `;
      
      // Try different patterns for matching: exact, starts with, contains
      const params = [
        name,                    // exact match
        name + '%',              // starts with
        '%' + name + '%'         // contains
      ];
      
      const productResult = await req.db.query(query, params);
      
      if (productResult.rows.length > 0) {
        // Match found in database
        const matchedProduct = productResult.rows[0];
        
        result.push({
          id: matchedProduct.id,
          name: matchedProduct.name,
          price: matchedProduct.price,
          mrp: matchedProduct.mrp,
          image_url: matchedProduct.image_url,
          quantity: matchedProduct.quantity,
          unit: matchedProduct.unit,
          category_id: matchedProduct.category_id,
          category_name: matchedProduct.category_name,
          inventory_count: matchedProduct.inventory_count,
          inStock: matchedProduct.inventory_count > 0,
          detectedQuantity: item.quantity || '1'
        });
      } else {
        // No match found in database
        result.push({
          id: null,
          name: item.name || 'Unknown Item',
          price: 0,
          mrp: 0,
          image_url: '',
          category_name: item.category || 'Unknown',
          inStock: false,
          detectedQuantity: item.quantity || '1'
        });
      }
    }
    
    res.json(result);
  } catch (error) {
    console.error('Error checking item availability:', error);
    res.status(500).json({ error: 'Server error' });
  }
});
module.exports = router;