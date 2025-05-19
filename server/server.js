// server/index.js
const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');
const bodyParser = require('body-parser');
const categoryRoutes = require('./routes/categories');
const productRoutes = require('./routes/products');
const orderRoutes = require('./routes/orders');
const imageAnalysisRoutes = require('./routes/imageAnalysis');

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ extended: true }));

// Database connection
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'blinkit_clone',
  password: 'your_password',
  port: 5432,
});

// Make db available to routes
app.use((req, res, next) => {
  req.db = pool;
  next();
});

// API Routes
app.use('/api/categories', categoryRoutes);
app.use('/api/products', productRoutes);
app.use('/api/orders', orderRoutes);
app.use('/api/image-analysis', imageAnalysisRoutes);

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
