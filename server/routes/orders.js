const express = require('express');
const router = express.Router();

// Get all orders
router.get('/', async (req, res) => {
  try {
    const result = await req.db.query('SELECT * FROM orders');
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching orders:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Create new order
router.post('/', async (req, res) => {
  try {
    const { user_id, address_id, order_total, delivery_charge, handling_charge, grand_total, payment_method, items } = req.body;
    
    // Start a transaction
    const client = await req.db.connect();
    
    try {
      await client.query('BEGIN');
      
      // Insert into orders table
      const orderResult = await client.query(
        `INSERT INTO orders 
        (user_id, address_id, order_total, delivery_charge, handling_charge, grand_total, payment_method)
        VALUES ($1, $2, $3, $4, $5, $6, $7)
        RETURNING id`,
        [user_id, address_id, order_total, delivery_charge, handling_charge, grand_total, payment_method]
      );
      
      const orderId = orderResult.rows[0].id;
      
      // Insert order items
      if (items && items.length > 0) {
        for (const item of items) {
          await client.query(
            `INSERT INTO order_items 
            (order_id, product_id, quantity, price, total)
            VALUES ($1, $2, $3, $4, $5)`,
            [orderId, item.product_id, item.quantity, item.price, item.total]
          );
        }
      }
      
      await client.query('COMMIT');
      
      res.status(201).json({ 
        message: 'Order created successfully',
        order_id: orderId
      });
    } catch (e) {
      await client.query('ROLLBACK');
      throw e;
    } finally {
      client.release();
    }
  } catch (error) {
    console.error('Error creating order:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get order by id
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    // Get order details
    const orderResult = await req.db.query(
      'SELECT * FROM orders WHERE id = $1',
      [id]
    );
    
    if (orderResult.rows.length === 0) {
      return res.status(404).json({ error: 'Order not found' });
    }
    
    // Get order items
    const itemsResult = await req.db.query(
      `SELECT oi.*, p.name, p.image_url 
       FROM order_items oi
       JOIN products p ON p.id = oi.product_id
       WHERE order_id = $1`,
      [id]
    );
    
    const order = {
      ...orderResult.rows[0],
      items: itemsResult.rows
    };
    
    res.json(order);
  } catch (error) {
    console.error('Error fetching order:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
