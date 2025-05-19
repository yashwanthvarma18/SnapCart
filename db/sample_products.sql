-- ─────────────────────────────────────────────────────────────────────────────
-- 1) (Optional) Clear existing data and reset the sequence
--    Run this only if you want to wipe out all existing products first.
-- ─────────────────────────────────────────────────────────────────────────────

TRUNCATE products CASCADE;
ALTER SEQUENCE products_id_seq RESTART WITH 1;

-- ─────────────────────────────────────────────────────────────────────────────
-- 2) Insert Products with Corrected category_id Values
--    (Make sure category_id matches your categories table:)
--      1 → Fruits & Vegetables
--      2 → Dairy & Breakfast
--      3 → Cold Drinks & Juices
--      4 → Snacks & Munchies
--      5 → Bakery & Biscuits
--      6 → Instant & Frozen Food
--      7 → Tea, Coffee & Health Drinks
--      8 → Atta, Rice & Dal
--      9 → Masala, Oil & More
--     10 → Bath & Body
--     11 → Cleaning Essentials
--     12 → Home & Office
--     13 → Baby Care
--     14 → Pet Care
--     15 → Pharmacy
--     16 → Paan Corner
-- ─────────────────────────────────────────────────────────────────────────────

-- 2.1) Fruits & Vegetables (category_id = 1)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Fresh Onion',
   'Fresh and premium quality onions.',
   35.00,
   49.00,
   28.57,
   1,
   'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,metadata=none,w=270/app/images/products/sliding_image/391306a.jpg',
   '1', 'kg', 100, 8, '7-10 days at room temperature', '10012345678901'
  ),
  ('Fresh Potato',
   'Fresh and clean potatoes.',
   33.00,
   36.00,
   8.33,
   1,
   'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,metadata=none,w=270/app/images/products/sliding_image/391305a.jpg',
   '1', 'kg', 120, 8, '7-10 days at room temperature', '10012345678901'
  ),
  ('Fresh Tomato',
   'Fresh and ripe tomatoes.',
   40.00,
   49.00,
   18.37,
   1,
   'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,metadata=none,w=270/app/images/products/sliding_image/391307a.jpg',
   '1', 'kg', 80, 8, '5-7 days at room temperature', '10012345678901'
  ),
  ('Green Apple',
   'Imported green apples, crisp and juicy.',
   160.00,
   189.00,
   15.34,
   1,
   'https://images.pexels.com/photos/693794/pexels-photo-693794.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
   '4', 'pcs', 50, 10, '10-14 days in refrigerator', '10012345678901'
  ),
  ('Banana',
   'Fresh and ripe bananas.',
   44.00,
   59.00,
   25.42,
   1,
   'https://m.media-amazon.com/images/I/31CaI8UzPtL._AC_UF350,350_QL80_.jpg',
   '6', 'pcs', 90, 8, '3-5 days at room temperature', '10012345678901'
  ),
  ('Cauliflower',
   'Fresh and clean cauliflower.',
   25.00,
   39.00,
   35.90,
   1,
   'https://m.media-amazon.com/images/I/91EdPVzD99L.jpg',
   '1', 'pc', 60, 9, '2-4 days in refrigerator', '10012345678901'
  ),
  ('Mango',
   'Sweet and juicy mangoes.',
   120.00,
   150.00,
   20.00,
   1,
   'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Mangos_-_single_and_halved.jpg/960px-Mangos_-_single_and_halved.jpg',
   '2', 'pcs', 100, 10, '7-10 days at room temperature', '10012345678901'
  ),
  ('Orange',
   'Fresh and tangy oranges.',
   100.00,
   120.00,
   16.67,
   1,
   'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Oranges_-_whole-halved-segment.jpg/960px-Oranges_-_whole-halved-segment.jpg',
   '4', 'pcs', 100, 10, '7-10 days at room temperature', '10012345678901'
  ),
  ('Grapes',
   'Seedless red grapes, sweet and fresh.',
   200.00,
   250.00,
   20.00,
   1,
   'https://www.bigbasket.com/media/uploads/p/l/40122445_6-fresho-grapes-green-residue-free.jpg',
   '500', 'g', 80, 8, '5-7 days in refrigerator', '10012345678901'
  ),
  ('Carrot',
   'Fresh organic carrots.',
   40.00,
   50.00,
   20.00,
   1,
   'https://bcfresh.ca/wp-content/uploads/2021/11/Carrots.jpg',
   '1', 'kg', 150, 8, '7-10 days at room temperature', '10012345678901'
  ),
  ('Cucumber',
   'Crisp and cooling cucumbers.',
   30.00,
   40.00,
   25.00,
   1,
   'https://m.media-amazon.com/images/I/71xkI-PIE5L.jpg',
   '1', 'kg', 120, 8, '7-10 days at room temperature', '10012345678901'
  ),
  ('Spinach',
   'Fresh green spinach leaves.',
   50.00,
   60.00,
   16.67,
   1,
   'https://m.media-amazon.com/images/I/6190UDgSyIL.jpg',
   '1', 'bunch', 50, 10, '5 days in refrigerator', '10012345678901'
  ),
  ('Broccoli',
   'Fresh broccoli florets.',
   80.00,
   100.00,
   20.00,
   1,
   'https://domf5oio6qrcr.cloudfront.net/medialibrary/5390/h1218g16207258089583.jpg',
   '500', 'g', 60, 8, '7 days in refrigerator', '10012345678901'
  );


-- 2.2) Dairy & Breakfast (category_id = 2)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Amul Butter',
   'Pasteurized butter made from fresh cream.',
   49.00,
   49.00,
   0.00,
   2,
   'https://gharstuff.com/wp-content/uploads/2019/03/Amul-Butter-100g.jpg',
   '100', 'g', 200, 6, '30 days in refrigerator', '10014321098765'
  ),
  ('Amul Gold Full Cream Milk',
   'Full cream milk rich in taste.',
   75.00,
   75.00,
   0.00,
   2,
   'https://www.jiomart.com/images/product/original/590002686/amul-gold-full-cream-milk-1-l-pouch-product-images-o590002686-p590049228-0-202409131647.jpg',
   '1', 'L', 150, 6, '2 days in refrigerator', '10014321098765'
  ),
  ('Nestle Milkmaid',
   'Sweetened condensed milk.',
   139.00,
   145.00,
   4.14,
   2,
   'https://m.media-amazon.com/images/I/71-YmW3qseL._AC_UF894,1000_QL80_.jpg',
   '400', 'g', 80, 7, '12 months in cool & dry place', '10014321098765'
  ),
  ('Eggs - Farm Fresh',
   'Farm fresh eggs with rich yolk.',
   95.00,
   115.00,
   17.39,
   2,
   'https://www.licious.in/blog/wp-content/uploads/2022/01/eggs-1.jpg',
   '6', 'pcs', 100, 8, '14 days in refrigerator', '10014321098765'
  ),
  ('Amul Cheese Slices',
   'Processed cheese slices.',
   129.00,
   129.00,
   0.00,
   2,
   'https://m.media-amazon.com/images/I/71vM-znOuDL._AC_UF1000,1000_QL80_.jpg',
   '200', 'g', 90, 7, '60 days in refrigerator', '10014321098765'
  ),
  ('Kellogg''s Corn Flakes',
   'Crispy breakfast cereal.',
   299.00,
   325.00,
   8.00,
   2,
   'https://m.media-amazon.com/images/I/81LshAMXAAL._AC_UF894,1000_QL80_.jpg',
   '875', 'g', 70, 10, '12 months in cool & dry place', '10014321098765'
  ),
  ('Greek Yogurt',
   'Creamy plain yogurt.',
   60.00,
   70.00,
   14.29,
   2,
   'https://m.media-amazon.com/images/I/613AStmWOKL.jpg',
   '500', 'g', 100, 6, '10 days in refrigerator', '10014321098765'
  ),
  ('Amul Paneer',
   'Homemade paneer cubes for cooking.',
   120.00,
   140.00,
   14.29,
   2,
   'https://m.media-amazon.com/images/I/81hD14MN91L.jpg',
   '200', 'g', 80, 6, '7 days in refrigerator', '10014321098765'
  );


-- 2.3) Cold Drinks & Juices (category_id = 3)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Coca-Cola Soft Drink',
   'Refreshing cola drink.',
   38.00,
   40.00,
   5.00,
   3,
   'https://cdn.grofers.com/app/assets/products/sliding_images/jpeg/6b98633c-7c6a-4708-a372-e2b49da568ab.jpg?ts=1707312322',
   '750', 'ml', 200, 5, '3 months at room temperature', '10017654321098'
  ),
  ('Pepsi',
   'Carbonated soft drink.',
   38.00,
   40.00,
   5.00,
   3,
   'https://5.imimg.com/data5/SELLER/Default/2023/8/333999308/CS/QG/ZW/142174826/1-l-pepsico-pepsi-juice.jpg',
   '750', 'ml', 180, 5, '3 months at room temperature', '10017654321098'
  ),
  ('Real Fruit Power Juice',
   'Made from real fruits.',
   99.00,
   110.00,
   10.00,
   3,
   'https://m.media-amazon.com/images/I/61xK5WOUSwL.jpg',
   '1', 'L', 120, 6, '6 months at room temperature', '10017654321098'
  ),
  ('Sprite Soft Drink',
   'Lemon flavored soft drink.',
   38.00,
   40.00,
   5.00,
   3,
   'https://m.media-amazon.com/images/I/71doy6em4jL.jpg',
   '750', 'ml', 170, 5, '3 months at room temperature', '10017654321098'
  ),
  ('Red Bull Energy Drink',
   'Energy drink that gives you wings.',
   115.00,
   125.00,
   8.00,
   3,
   'https://m.media-amazon.com/images/I/51Bp30CR3IL.jpg',
   '250', 'ml', 80, 8, '12 months at room temperature', '10017654321098'
  );


-- 2.4) Snacks & Munchies (category_id = 4)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Lay''s Potato Chips - India''s Magic Masala',
   'Crunchy potato chips with magic masala flavor.',
   29.00,
   30.00,
   3.33,
   4,
   'https://m.media-amazon.com/images/I/71Ge9n3gmYL.jpg',
   '52', 'g', 200, 5, '3 months at room temperature', '10018765432109'
  ),
  ('Kurkure Masala Munch',
   'Crunchy corn snack.',
   29.00,
   30.00,
   3.33,
   4,
   'https://m.media-amazon.com/images/I/81EhmuRbGQL.jpg',
   '85', 'g', 180, 5, '3 months at room temperature', '10018765432109'
  ),
  ('Bingo! Mad Angles - Achaari Masti',
   'Triangle-shaped snack with spicy flavor.',
   28.00,
   30.00,
   6.67,
   4,
   'https://www.bigbasket.com/media/uploads/p/xxl/238341_24-bingo-mad-angles-achaari-masti.jpg',
   '66', 'g', 150, 6, '4 months at room temperature', '10018765432109'
  ),
  ('Too Yumm! Multigrain Chips',
   'Baked not fried healthy snack.',
   48.00,
   50.00,
   4.00,
   4,
   'https://m.media-amazon.com/images/I/71m8E3zVoEL.jpg',
   '54', 'g', 100, 7, '6 months at room temperature', '10018765432109'
  ),
  ('Haldiram''s Aloo Bhujia',
   'Traditional spicy snack.',
   48.00,
   55.00,
   12.73,
   4,
   'https://www.haldirams.com/media/catalog/product/cache/71134970afb779eb7860339989626b7e/a/l/aloo_bhujia12344.jpg',
   '200', 'g', 120, 6, '6 months at room temperature', '10018765432109'
  );


-- 2.5) Bakery & Biscuits (category_id = 5)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Britannia Good Day Butter Cookies',
   'Crunchy butter cookies.',
   29.00,
   30.00,
   3.33,
   5,
   'https://m.media-amazon.com/images/I/617MS6ibaqL._AC_UF1000,1000_QL80_.jpg',
   '200', 'g', 200, 5, '6 months at room temperature', '10019876543210'
  ),
  ('Parle-G Original Glucose Biscuits',
   'Original glucose biscuits.',
   10.00,
   10.00,
   0.00,
   5,
   'https://m.media-amazon.com/images/I/71bufOt9zAL._AC_UF1000,1000_QL80_.jpg',
   '70', 'g', 300, 4, '9 months at room temperature', '10019876543210'
  ),
  ('Modern Bread - White',
   'Soft white bread.',
   40.00,
   40.00,
   0.00,
   5,
   'https://m.media-amazon.com/images/I/71dyuWp4bRL._AC_UF1000,1000_QL80_.jpg',
   '400', 'g', 50, 7, '4 days at room temperature', '10019876543210'
  ),
  ('Britannia Cake - Fruit',
   'Fruit flavored cake.',
   25.00,
   30.00,
   16.67,
   5,
   'https://m.media-amazon.com/images/I/61jgaxBM6CL.jpg',
   '65', 'g', 80, 6, '3 months at room temperature', '10019876543210'
  ),
  ('Cadbury Oreo Vanilla Creme Biscuits',
   'Chocolate sandwich cookies with vanilla creme.',
   29.00,
   30.00,
   3.33,
   5,
   'https://m.media-amazon.com/images/I/6128dbj4zpL.jpg',
   '120', 'g', 150, 5, '9 months at room temperature', '10019876543210'
  );


-- 2.6) Instant & Frozen Food (category_id = 6)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Maggi 2-Minute Noodles',
   'Instant noodles ready in 2 minutes.',
   14.00,
   14.00,
   0.00,
   6,
   'https://m.media-amazon.com/images/I/812ujEPZcML._AC_UF1000,1000_QL80_.jpg',
   '70', 'g', 300, 5, '12 months at room temperature', '10013216549870'
  ),
  ('McCain French Fries',
   'Ready to cook frozen french fries.',
   179.00,
   199.00,
   10.05,
   6,
   'https://rukminim2.flixcart.com/image/850/1000/xif0q/ready-meal/r/k/s/-original-imah8wgzpy9xqgvf.jpeg?q=90&crop=false',
   '420', 'g', 60, 12, '18 months in freezer', '10013216549870'
  ),
  ('Top Ramen Curry Noodles',
   'Instant curry flavored noodles.',
   54.00,
   60.00,
   10.00,
   6,
   'https://m.media-amazon.com/images/I/911POVRuAmL._AC_UF1000,1000_QL80_.jpg',
   '280', 'g', 100, 7, '12 months at room temperature', '10013216549870'
  ),
  ('MTR Ready to Eat - Paneer Butter Masala',
   'Ready to eat meal.',
   99.00,
   105.00,
   5.71,
   6,
   'https://m.media-amazon.com/images/I/71Z6zTTr7iL._AC_UF350,350_QL80_.jpg',
   '300', 'g', 40, 8, '12 months at room temperature', '10013216549870'
  ),
  ('Yummiez Chicken Nuggets',
   'Ready to cook chicken nuggets.',
   219.00,
   250.00,
   12.40,
   6,
   'https://www.bigbasket.com/media/uploads/p/xxl/40005418_5-yummiez-nuggets-chicken.jpg',
   '250', 'g', 30, 14, '12 months in freezer', '10013216549870'
  );


-- 2.7) Tea, Coffee & Health Drinks (category_id = 7)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Tata Tea Premium',
   'Strong and flavourful tea.',
   265.00,
   290.00,
   8.62,
   7,
   'https://m.media-amazon.com/images/I/61bDl5fYeCL.jpg',
   '500', 'g', 150, 8, '12 months at room temperature', '10011122233344'
  ),
  ('Nescafe Classic Coffee',
   'Pure instant coffee.',
   265.00,
   290.00,
   8.62,
   7,
   'https://m.media-amazon.com/images/I/71OexQTz4-L.jpg',
   '50', 'g', 120, 7, '24 months at room temperature', '10011122233344'
  ),
  ('Bournvita Health Drink',
   'Malted chocolate drink mix.',
   219.00,
   240.00,
   8.75,
   7,
   'https://m.media-amazon.com/images/I/61oRJDWrXRL.jpg',
   '500', 'g', 90, 9, '12 months at room temperature', '10011122233344'
  ),
  ('Red Label Tea',
   'Natural blend of tea leaves.',
   222.00,
   245.00,
   9.39,
   7,
   'https://m.media-amazon.com/images/I/51hdl9zEmGL._AC_UF894,1000_QL80_DpWeblab_.jpg',
   '500', 'g', 120, 8, '12 months at room temperature', '10011122233344'
  ),
  ('Horlicks Health & Nutrition Drink',
   'Malted drink mix with essential nutrients.',
   299.00,
   330.00,
   9.39,
   7,
   'https://m.media-amazon.com/images/I/51VlwTldHAL.jpg',
   '500', 'g', 100, 8, '12 months at room temperature', '10011122233344'
  );


-- 2.8) Home & Office (category_id = 12)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Ballpoint Pen',
   'Smooth‐writing blue ink ballpoint pen, 0.7 mm tip.',
   10.00,
   15.00,
   33.33,
   12,
   'https://www.montblanc.com/variants/images/1647597318123162/A/w2500.jpg',
   '1', 'pcs', 500, 3, 'N/A', '00000000000000'
  ),
  ('Exercise Notebook',
   'A5 ruled exercise notebook, 200 pages.',
   25.00,
   30.00,
   16.67,
   12,
   'https://paperquirks.in/cdn/shop/files/A4SingleLine1.jpg?v=1706013267',
   '1', 'pcs', 300, 3, 'N/A', '00000000000000'
  ),
  ('Scotch Tape',
   'Transparent adhesive tape, 18 mm × 10 m.',
   35.00,
   40.00,
   12.50,
   12,
   'https://m.media-amazon.com/images/I/71EXl4OYzUL.jpg',
   '1', 'roll', 250, 2, 'N/A', '00000000000000'
  );


-- 2.9) Baby Care (category_id = 13)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Pampers Swaddlers Diapers (Pack of 20)',
   'Super‐absorbent diapers for infants, size 3–6 kg.',
   450.00,
   499.00,
   9.82,
   13,
   'https://m.media-amazon.com/images/I/81NvjVv9j9L.jpg',
   '20', 'pcs', 150, 2, 'N/A', '00000000000000'
  ),
  ('Johnson''s Baby Shampoo',
   'No more tears formulation baby shampoo, 300 ml.',
   199.00,
   249.00,
   20.08,
   13,
   'https://assets.ajio.com/medias/sys_master/root/20230415/FlPx/6439dde2711cf97ba729e151/-473Wx593H-4900020640-multi-MODEL.jpg',
   '300', 'ml', 120, 2, '12 months at room temperature', '00000000000000'
  ),
  ('Pampers Baby Wipes (Pack of 60)',
   'Gentle moisturizing wipes, fragrance‐free.',
   149.00,
   179.00,
   16.76,
   13,
   'https://m.media-amazon.com/images/I/81o9XzVb3SL.jpg',
   '60', 'pcs', 180, 2, '12 months at room temperature', '00000000000000'
  ),
  ('Johnson''s Baby Powder (Talc)',
   'Classic talcum baby powder, 400 g.',
   259.00,
   299.00,
   13.37,
   13,
   'https://m.media-amazon.com/images/I/414MZ4RJ1KL.jpg',
   '400', 'g', 100, 4, '36 months at room temperature', '00000000000000'
  ),
  ('Johnson''s Bedtime® Baby Lotion',
   'Gentle bedtime lotion with lavender aroma, 200 ml.',
   239.00,
   275.00,
   13.09,
   13,
   'https://m.media-amazon.com/images/I/61+AZuIjH5L.jpg',
   '200', 'ml', 80, 4, '24 months at room temperature', '00000000000000'
  );


-- 2.10) Bath & Body (category_id = 10)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Dove Original Beauty Bar (75 g)',
   'Moisturizing cream bar soap with ¼ moisturizing cream.',
   45.00,
   55.00,
   18.18,
   10,
   'https://5.imimg.com/data5/SELLER/Default/2024/11/469458800/DV/DT/DR/47443988/65fd93beda7efa4ded125afc-dove-original-deep-moisture-beauty-bar.jpg',
   '1', 'bar (75 g)', 200, 3, 'N/A', '00000000000000'
  ),
  ('Dove Shower Gel',
   'Nourishing body wash with gentle cleansers, 250 ml.',
   129.00,
   149.00,
   13.42,
   10,
   'https://m.media-amazon.com/images/I/419w4PBH11L.jpg',
   '250', 'ml', 150, 3, '24 months at room temperature', '00000000000000'
  ),
  ('Lakmé Fresh Skin Face Wash',
   'Gentle cleansing face wash with almond extracts, 100 ml.',
   99.00,
   119.00,
   16.81,
   10,
   'https://www.bigbasket.com/media/uploads/p/m/40124242-2_12-lakme-blush-glow-face-wash-with-vitamin-c-removes-excess-oil-lemon-fresh.jpg',
   '100', 'ml', 120, 3, '24 months at room temperature', '00000000000000'
  ),
  ('Nivea Body Lotion',
   'Deep care body lotion with natural oils, 200 ml.',
   179.00,
   199.00,
   10.05,
   10,
   'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9686485/2024/6/24/fe38d6d5-7f13-4054-b173-6fe41730c1481719224111493-Nivea-Unisex-Cocoa-Nourish-48h-Deep-Moisturising-For-Very-Dr-1.jpg',
   '200', 'ml', 100, 3, '24 months at room temperature', '00000000000000'
  ),
  ('Park Avenue Men Deodorant',
   'Long lasting men’s roll‐on deodorant, 150 ml.',
   139.00,
   159.00,
   12.58,
   10,
   'https://m.media-amazon.com/images/I/61y2ymmYu9L.jpg',
   '150', 'ml', 80, 3, '24 months at room temperature', '00000000000000'
  );


-- 2.11) Cleaning Essentials (category_id = 11)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Vim Dishwash Bar',
   'Stain removal dishwashing bar, 200 g.',
   19.00,
   25.00,
   24.00,
   11,
   'https://m.media-amazon.com/images/I/61dTZuKWMML._AC_UF1000,1000_QL80_.jpg',
   '200', 'g', 200, 2, 'N/A', '00000000000000'
  ),
  ('Harpic Toilet Cleaner',
   'Lemon fragrance toilet cleaner, 500 ml.',
   79.00,
   99.00,
   20.20,
   11,
   'https://m.media-amazon.com/images/I/61-jfxZ4VJL._AC_UF1000,1000_QL80_DpWeblab_.jpg',
   '500', 'ml', 100, 2, '24 months at room temperature', '00000000000000'
  ),
  ('Lizol Floor Cleaner',
   'Lemon fresh floor disinfectant, 1 L.',
   99.00,
   129.00,
   23.26,
   11,
   'https://m.media-amazon.com/images/I/61W8NHxqS8L.jpg',
   '1', 'L', 80, 2, '24 months at room temperature', '00000000000000'
  ),
  ('Surf Excel Matic',
   'Detergent for washing machine, top load, 2 kg.',
   299.00,
   349.00,
   14.33,
   11,
   'https://upload.wikimedia.org/wikipedia/commons/6/67/Surf_Excel_Matic.jpg',
   '2', 'kg', 60, 2, '12 months at room temperature', '00000000000000'
  ),
  ('Vim Dishwash Liquid',
   'Lemon fresh dishwash liquid, 500 ml.',
   35.00,
   45.00,
   22.22,
   11,
   'https://m.media-amazon.com/images/I/51rhw--KcDL._AC_UF1000,1000_QL80_.jpg',
   '500', 'ml', 150, 2, '24 months at room temperature', '00000000000000'
  );


-- 2.12) Masala, Oil & More (category_id = 9)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('MDH Garam Masala',
   'Authentic Indian spice blend, 100 g.',
   85.00,
   100.00,
   15.00,
   9,
   'https://m.media-amazon.com/images/I/61MyqJ4PkEL.jpg',
   '100', 'g', 200, 3, '12 months at room temperature', '00000000000000'
  ),
  ('Everest Turmeric Powder',
   'Premium ground turmeric, 200 g.',
   69.00,
   80.00,
   13.75,
   9,
   'https://m.media-amazon.com/images/I/61zO-8V6qPL._AC_UF1000,1000_QL80_.jpg',
   '200', 'g', 150, 3, '12 months at room temperature', '00000000000000'
  ),
  ('Fortune Sunflower Oil',
   'Refined sunflower oil, 1 L.',
   180.00,
   200.00,
   10.00,
   9,
   'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/NI_CATALOG/IMAGES/CIW/2025/4/18/e191fa20-2e61-41ca-a0d7-7a7fc8401142_1766_1.png',
   '1', 'L', 100, 3, '12 months at room temperature', '00000000000000'
  ),
  ('Fortune Rice Bran Oil',
   'Heart‐healthy rice bran oil, 1 L.',
   199.00,
   220.00,
   9.55,
   9,
   'https://m.media-amazon.com/images/I/61Jb7TOqaeL.jpg',
   '1', 'L', 80, 3, '12 months at room temperature', '00000000000000'
  );


-- 2.13) Pet Care (category_id = 14)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Pedigree Dog Food',
   'Dry dog food for adult dogs, 1 kg.',
   299.00,
   350.00,
   14.57,
   14,
   'https://m.media-amazon.com/images/I/818-3L9i6aL.jpg',
   '1', 'kg', 100, 5, '12 months at room temperature', '00000000000000'
  ),
  ('Drools Puppy Food',
   'Complete puppy nutrition, 1 kg.',
   339.00,
   379.00,
   10.55,
   14,
   'https://m.media-amazon.com/images/I/616v6VY8tlL._AC_UF1000,1000_QL80_.jpg',
   '1', 'kg', 80, 5, '12 months at room temperature', '00000000000000'
  ),
  ('Whiskas Cat Food',
   'Tuna flavor wet cat food, 500 g.',
   89.00,
   99.00,
   10.10,
   14,
   'https://m.media-amazon.com/images/I/71iqQmL76cL._AC_UF1000,1000_QL80_.jpg',
   '500', 'g', 120, 5, '24 months at room temperature', '00000000000000'
  ),
  ('Cif Surface Cleaner',
   'Antibacterial surface cleaner for pet areas, 500 ml.',
   129.00,
   149.00,
   13.42,
   14,
   'https://m.media-amazon.com/images/I/61mKD5ylozL.jpg',
   '500', 'ml', 50, 5, '24 months at room temperature', '00000000000000'
  ),
  ('Petcare Multivitamin Tablet',
   'Daily multivitamin tablets for dogs & cats, 30 tablets.',
   249.00,
   299.00,
   16.72,
   14,
   'https://m.media-amazon.com/images/I/41u8bALC+cL._AC_UF1000,1000_QL80_.jpg',
   '30', 'tablets', 60, 5, '24 months at room temperature', '00000000000000'
  );


-- 2.14) Pharmacy (category_id = 15)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Crocin 500 mg (Paracetamol)',
   'Pain relief and fever reducer, 10 tablets.',
   20.00,
   25.00,
   20.00,
   15,
   'https://cdn01.pharmeasy.in/dam/products/049311/crocin-advance-500mg-strip-of-15-tablets-front-2-1620831911.jpg',
   '10', 'tablets', 500, 1, '24 months at room temperature', '00000000000000'
  ),
  ('Shelcal‐O (Calcium + Vitamin D)',
   'Bone health supplement, 500 mg calcium + vitamin D, 10 tablets.',
   55.00,
   65.00,
   15.38,
   15,
   'https://cdn01.pharmeasy.in/dam/products_otc/159115/shelcal-500mg-strip-of-15-tablets-2-1679999355.jpg',
   '10', 'tablets', 300, 1, '24 months at room temperature', '00000000000000'
  ),
  ('Vicks VapoRub',
   'Topical cough suppressant & decongestant balm, 50 g.',
   165.00,
   190.00,
   13.16,
   15,
   'https://m.media-amazon.com/images/I/61IPu+zLouL._AC_UF1000,1000_QL80_.jpg',
   '50', 'g', 200, 1, '36 months at room temperature', '00000000000000'
  ),
  ('Saridon (Prodrug analgesic)',
   'Rapid pain relief tablets, 10 tablets.',
   45.00,
   55.00,
   18.18,
   15,
   'https://www.netmeds.com/images/product-v1/600x600/109486/saridon_headache_relief_tablet_10s_663469_0_0.jpg',
   '10', 'tablets', 150, 1, '24 months at room temperature', '00000000000000'
  ),
  ('Dolo 650 mg (Paracetamol)',
   'High‐strength pain and fever 650 mg, 10 tablets.',
   60.00,
   70.00,
   14.29,
   15,
   'https://5.imimg.com/data5/SELLER/Default/2023/12/369247058/BS/ZD/LQ/101727781/dolo-650-paracetamol-tablets.jpeg',
   '10', 'tablets', 100, 1, '24 months at room temperature', '00000000000000'
  );


-- 2.15) Paan Corner (category_id = 16)
INSERT INTO products
  (name, description, price, mrp, discount_percentage, category_id,
   image_url, quantity, unit, inventory_count, delivery_time, shelf_life, fssai_license)
VALUES
  ('Classic Meetha Paan',
   'Traditional Indian sweet paan with gulkand, candied fennel, and silver vark.',
   25.00,
   30.00,
   ROUND((30.00 - 25.00) / 30.00 * 100, 2),
   16,
   '',
   '1', 'piece', 200, 10, '1 day', 'FSSAI1234567890'
  ),
  ('Chocolate Paan',
   'Fusion paan flavored with chocolate and dry fruits.',
   35.00,
   40.00,
   ROUND((40.00 - 35.00) / 40.00 * 100, 2),
   16,
   '',
   '1', 'piece', 150, 10, '1 day', 'FSSAI1234567891'
  ),
  ('Banarasi Khajoor Paan',
   'Banarasi-style paan made with dates (khajoor), sweet spices, and beetle leaf.',
   45.00,
   50.00,
   ROUND((50.00 - 45.00) / 50.00 * 100, 2),
   16,
   '',
   '1', 'piece', 100, 12, '1 day', 'FSSAI1234567892'
  );
