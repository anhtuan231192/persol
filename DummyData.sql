USE persol_db;

-- Insert Brands
INSERT INTO BRANDS (brand_code, brand_name, brand_logo) VALUES
('PERSOL', 'Persol', 'persol_logo.png'),
('RAYBAN', 'Ray-Ban', 'rayban_logo.png'),
('OAKLEY', 'Oakley', 'oakley_logo.png');

-- Insert Categories
INSERT INTO CATEGORIES (category_code, category_name, category_description) VALUES
('SUNGLASSES', 'Sunglasses', 'Protective and fashionable sunglasses'),
('EYEGLASSES', 'Eyeglasses', 'Prescription and reading glasses'),
('SPORTS', 'Sports Eyewear', 'Performance eyewear for sports activities');

-- Insert Product Types
INSERT INTO PRODUCT_TYPES (type_code, type_name, type_description, display_order) VALUES
('AVIATOR', 'Aviator', 'Classic aviator style frames', 1),
('WAYFARER', 'Wayfarer', 'Iconic wayfarer design', 2),
('ROUND', 'Round', 'Vintage round frames', 3),
('RECTANGLE', 'Rectangle', 'Modern rectangular frames', 4);

-- Insert Products
INSERT INTO `products` (`product_id`, `brand_id`, `category_id`, `type_id`, `product_name`, `product_description`, `Price`, `stock_quantity`, `stock_status`, `main_image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Classic Aviator Gold', 'Gold metal frame, classic green G-15 lenses.', 48, 55, 'in_stock', '15.jpg', '2025-10-27 19:20:31', '2025-10-27 19:25:08'),
(2, 2, 1, NULL, 'Holbrook Matte Black Prizm', 'Lightweight O Matter™ frame, Prizm™ lenses enhance color.', 42, 30, 'in_stock', '9.jpg', '2025-10-27 19:20:31', '2025-10-27 19:26:18'),
(3, 1, 2, NULL, 'Wayfarer Black Frame', 'Legendary black acetate frame.', 35, 40, 'in_stock', '3.jpg', '2025-10-27 19:20:31', '2025-10-27 19:26:58'),
(4, 2, 2, NULL, 'Metalink Satin Black', 'Lightweight metal frame, modern design.', 39, 25, 'in_stock', '7.jpg', '2025-10-27 19:20:31', '2025-10-27 19:28:10'),
(5, 1, 1, NULL, 'Round Metal Legend Gold', 'Round metal frame, retro style.', 46, 60, 'in_stock', '11.jpg', '2025-10-27 19:20:31', '2025-10-27 19:29:03'),
(6, 3, 1, NULL, 'Persol 649 Havana Brown', 'Persol icon with the distinctive Meflecto bridge.', 55, 15, 'in_stock', '5.jpg', '2025-10-27 19:20:31', '2025-10-27 19:29:51'),
(7, 4, 2, NULL, 'Oakley Crosslink Pitch Grey', 'Versatile frame, suitable for sports.', 37, 35, 'in_stock', '14.jpg', '2025-10-27 19:20:31', '2025-10-27 19:30:54'),
(8, 1, 1, NULL, 'Clubmaster Classic Black', 'Unique semi-rimless design.', 43, 45, 'in_stock', '2.jpg', '2025-10-27 19:20:31', '2025-10-27 19:31:44'),
(9, 5, 2, NULL, 'Gucci GG0026O Black', 'Premium plastic frame, prominent Gucci logo.', 68, 18, 'in_stock', '10.jpg', '2025-10-27 19:20:31', '2025-10-27 19:32:41'),
(10, 3, 1, NULL, 'Persol PO3019S Black', 'Classic Persol pilot style.', 51, 22, 'in_stock', '1.jpg', '2025-10-27 19:20:31', '2025-10-27 19:33:02'),
(11, 1, 1, NULL, 'Erika Classic Havana', 'Lightweight round frame, metal bridge.', 39, 50, 'in_stock', '17.jpg', '2025-10-27 19:20:31', '2025-10-27 19:33:38'),
(12, 2, 1, NULL, 'Frogskins Lite Matte Black', 'Bottomless rim design, 80s style.', 36, 28, 'in_stock', '4.jpg', '2025-10-27 19:20:31', '2025-10-27 19:34:33'),
(13, 4, 2, 2, 'Oakley Socket 5.5 Satin', 'Ultra-lightweight and durable metal frame.', 41, 33, 'in_stock', '8.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(14, 5, 1, NULL, 'Gucci GG0516S Havana', 'Oversized sunglasses, luxurious style.', 72, 12, 'in_stock', '12.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(15, 1, 2, NULL, 'RB3447V Round Metal Frame', 'Slim round metal frame.', 34, 48, 'in_stock', '6.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(16, 3, 2, 1, 'Persol PO3007V Havana', 'Classic square frame, acetate material.', 49, 19, 'in_stock', '16.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(17, 2, 1, 2, 'Sutro Lite Sweep Prizm Road', 'Specialized sports glasses for cycling.', 45, 20, 'in_stock', '3.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(18, 1, 1, NULL, 'Justin Classic Black Rubber', 'Modern variation of the Wayfarer.', 37, 52, 'in_stock', '10.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(19, 4, 2, 3, 'Oakley Holbrook RX Woodgrain', 'Holbrook eyeglass frame, Rx version.', 36, 31, 'in_stock', '1.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(20, 5, 2, NULL, 'Gucci GG1011O Transparent Grey', 'Fashionable transparent plastic frame.', 65, 14, 'on_order', '9.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(21, 1, 1, 1, 'RB4171 Erika Velvet Black', 'Unique velvet-coated frame.', 41, 44, 'in_stock', '13.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(22, 2, 2, 2, 'Oakley Latch Beta Matte Grey', 'Designed with a clip to latch onto your shirt.', 38, 26, 'in_stock', '7.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(23, 3, 1, NULL, 'Persol PO3272S Green Lens', 'Square sunglasses, green lenses.', 53, 21, 'in_stock', '4.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(24, 1, 2, NULL, 'RB5154 Clubmaster Optics', 'Clubmaster eyeglass frame.', 33, 49, 'in_stock', '11.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(25, 4, 1, 3, 'Oakley Clifden Prizm Snow', 'Specialized glasses for mountaineering, skiing.', 49, 17, 'in_stock', '15.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(26, 5, 1, NULL, 'Gucci GG0811S Black Gold', 'Large square sunglasses, gold details.', 75, 10, 'in_stock', '2.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(27, 1, 1, NULL, 'Hexagonal Flat Lenses Gold', 'Hexagonal frame, modern flat lenses.', 47, 58, 'in_stock', '8.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(28, 2, 1, 1, 'Oakley Turbine Rotor Prizm Deep Water', 'Wrap-around sports glasses, fishing lenses.', 43, 23, 'in_stock', '17.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(29, 3, 2, 2, 'Persol PO3160V Black', 'Rectangular frame, simple and elegant.', 47, 20, 'in_stock', '5.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(30, 1, 2, NULL, 'RB7140 Round Fleck Havana', 'Round frame combining metal and plastic.', 35, 42, 'in_stock', '9.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(31, 4, 2, 3, 'Oakley Tie Bar Satin Black', 'Ultra-lightweight Titanium rimless frame.', 48, 24, 'in_stock', '14.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(32, 5, 2, NULL, 'Gucci GG0396O Havana', 'Fashionable cat-eye frame.', 66, 16, 'in_stock', '1.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(33, 1, 1, 1, 'Aviator Large Metal II Gold', 'Improved version of the Aviator.', 49, 53, 'in_stock', '6.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(34, 2, 1, 2, 'Oakley Gascan Matte Black Iridium', 'Angular, aggressive design.', 37, 29, 'in_stock', '12.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(35, 3, 1, NULL, 'Persol PO0714 Folding Havana', 'Unique foldable sunglasses.', 58, 13, 'out_of_stock', '3.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(36, 1, 2, NULL, 'RB2180 Round Havana', 'Round acetate frame.', 36, 46, 'in_stock', '10.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(37, 4, 1, 3, 'Oakley Portal X Prizm Grey', 'Versatile glasses, suitable for many activities.', 40, 34, 'in_stock', '16.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(38, 5, 1, NULL, 'Gucci GG0631S Oversized Square', 'Large square glasses, bold style.', 71, 11, 'in_stock', '7.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(39, 1, 1, 1, 'Wayfarer Ease Black', 'Thinner and lighter Wayfarer version.', 38, 41, 'in_stock', '11.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(40, 2, 2, 2, 'Oakley Pitchman R Carbon', 'Round frame, carbon fiber temples.', 44, 27, 'in_stock', '15.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(41, 3, 2, NULL, 'Persol PO3263V Terra Di Siena', 'Eyeglass frame in characteristic earth tone.', 50, 18, 'in_stock', '2.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(42, 1, 1, NULL, 'RB3548N Hexagonal Evolve Photochromic', 'Lenses that change color with light.', 51, 38, 'in_stock', '8.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(43, 4, 2, 1, 'Oakley Base Plane R Satin Black', 'Minimalist metal frame.', 39, 32, 'in_stock', '17.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(44, 5, 2, NULL, 'Gucci GG0407O Gold Metal', 'Gold-plated metal frame.', 69, 15, 'in_stock', '4.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(45, 1, 1, 2, 'New Wayfarer Matte Black', 'New version, smaller frame.', 36, 47, 'in_stock', '12.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(46, 2, 1, 3, 'Oakley Jawbreaker Prizm Trail', 'Off-road sports glasses.', 47, 21, 'in_stock', '1.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(47, 3, 1, NULL, 'Persol PO3210S Madreterra', 'Sunglasses in special earth brown color.', 54, 16, 'in_stock', '9.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(48, 1, 2, NULL, 'RB4165 Justin Rubberized Black', 'Rubber-coated frame, youthful.', 34, 51, 'in_stock', '13.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(49, 4, 1, 1, 'Oakley EVZero Blades Prizm Sapphire', 'Ultra-lightweight rimless glasses.', 42, 25, 'in_stock', '6.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31'),
(50, 5, 1, 2, 'Gucci GG0726S Aviator Style', 'Gucci style aviator glasses.', 73, 9, 'on_order', '10.jpg', '2025-10-27 19:20:31', '2025-10-27 19:20:31');

-- Insert Product Specifications
-- Ensure product IDs 1 through 50 exist in the PRODUCTS table before running this.

INSERT INTO PRODUCT_SPECIFICATIONS (product_id, spec_name, spec_value) VALUES
-- Product 1: Classic Aviator Gold (Ray-Ban)
(1, 'Frame Material', 'Metal'), (1, 'Lens Material', 'Crystal'), (1, 'Lens Color', 'Green G-15'), (1, 'Size', '58mm'), (1, 'UV Protection', '100%'),
-- Product 2: Holbrook Matte Black Prizm (Oakley)
(2, 'Frame Material', 'O Matter™'), (2, 'Lens Material', 'Plutonite®'), (2, 'Lens Technology', 'Prizm™'), (2, 'Frame Color', 'Matte Black'), (2, 'UV Protection', '100%'),
-- Product 3: Wayfarer Black Frame (Ray-Ban)
(3, 'Frame Material', 'Acetate'), (3, 'Frame Color', 'Black'), (3, 'Lens Width', '50mm'), (3, 'Bridge Width', '22mm'),
-- Product 4: Metalink Satin Black (Oakley Rx)
(4, 'Frame Material', 'Metal'), (4, 'Frame Color', 'Satin Black'), (4, 'Frame Shape', 'Rectangle'), (4, 'Bridge Type', 'Adjustable Nosepads'),
-- Product 5: Round Metal Legend Gold (Ray-Ban)
(5, 'Frame Material', 'Metal'), (5, 'Lens Material', 'Crystal'), (5, 'Frame Color', 'Gold'), (5, 'Frame Shape', 'Round'), (5, 'Size', '50mm'),
-- Product 6: Persol 649 Havana Brown (Persol)
(6, 'Frame Material', 'Acetate'), (6, 'Frame Color', 'Havana'), (6, 'Lens Material', 'Crystal'), (6, 'Bridge Feature', 'Keyhole Bridge + Meflecto'), (6, 'Temple Feature', 'Arrow Hinge'),
-- Product 7: Oakley Crosslink Pitch Grey (Oakley Rx)
(7, 'Frame Material', 'O Matter™'), (7, 'Frame Color', 'Grey Smoke'), (7, 'Temple Feature', 'Interchangeable Temples'), (7, 'Grip', 'Unobtainium®'),
-- Product 8: Clubmaster Classic Black (Ray-Ban)
(8, 'Frame Material', 'Acetate & Metal'), (8, 'Frame Color', 'Black/Gold'), (8, 'Lens Color', 'Green G-15'), (8, 'Style', 'Browline'),
-- Product 9: Gucci GG0026O Black (Gucci)
(9, 'Frame Material', 'Acetate'), (9, 'Frame Color', 'Black'), (9, 'Style', 'Oversized Square'), (9, 'Hinge', 'Standard'),
-- Product 10: Persol PO3019S Black (Persol)
(10, 'Frame Material', 'Acetate'), (10, 'Frame Color', 'Black'), (10, 'Lens Type', 'Polarized'), (10, 'Temple Feature', 'Arrow Hinge'),
-- Product 11: Erika Classic Havana (Ray-Ban)
(11, 'Frame Material', 'Nylon/Metal'), (11, 'Frame Color', 'Havana'), (11, 'Lens Color', 'Brown Gradient'), (11, 'Frame Shape', 'Round'),
-- Product 12: Frogskins Lite Matte Black (Oakley)
(12, 'Frame Material', 'O Matter™'), (12, 'Frame Color', 'Matte Black'), (12, 'Style', 'Semi-Rimless'), (12, 'Lens Technology', 'Standard'),
-- Product 13: Oakley Socket 5.5 Satin (Oakley Rx)
(13, 'Frame Material', 'C-5™ Alloy'), (13, 'Frame Color', 'Satin Black'), (13, 'Temple Feature', 'Unobtainium® Earsocks'), (13, 'Frame Shape', 'Rectangle'),
-- Product 14: Gucci GG0516S Havana (Gucci)
(14, 'Frame Material', 'Acetate'), (14, 'Frame Color', 'Havana'), (14, 'Lens Color', 'Brown'), (14, 'Style', 'Oversized Square'), (14, 'UV Protection', '100%'),
-- Product 15: RB3447V Round Metal Frame (Ray-Ban)
(15, 'Frame Material', 'Metal'), (15, 'Frame Color', 'Gold'), (15, 'Frame Shape', 'Round'), (15, 'Bridge Type', 'Adjustable Nosepads'),
-- Product 16: Persol PO3007V Havana (Persol)
(16, 'Frame Material', 'Acetate'), (16, 'Frame Color', 'Havana'), (16, 'Frame Shape', 'Square'), (16, 'Temple Feature', 'Arrow Hinge'),
-- Product 17: Sutro Lite Sweep Prizm Road (Oakley)
(17, 'Frame Material', 'O Matter™'), (17, 'Lens Technology', 'Prizm™ Road'), (17, 'Fit', 'Standard'), (17, 'Sport', 'Cycling'),
-- Product 18: Justin Classic Black Rubber (Ray-Ban)
(18, 'Frame Material', 'Nylon'), (18, 'Frame Color', 'Rubber Black'), (18, 'Lens Color', 'Grey Gradient'), (18, 'Frame Shape', 'Rectangle'),
-- Product 19: Oakley Holbrook RX Woodgrain (Oakley Rx)
(19, 'Frame Material', 'Acetate'), (19, 'Frame Color', 'Woodgrain'), (19, 'Frame Shape', 'Square'), (19, 'Style', 'Lifestyle'),
-- Product 20: Gucci GG1011O Transparent Grey (Gucci)
(20, 'Frame Material', 'Acetate'), (20, 'Frame Color', 'Transparent Grey'), (20, 'Frame Shape', 'Rectangle'), (20, 'Style', 'Fashion'),
-- Product 21: RB4171 Erika Velvet Black (Ray-Ban)
(21, 'Frame Material', 'Nylon Velvet'), (21, 'Frame Color', 'Black Velvet'), (21, 'Lens Color', 'Grey Gradient'), (21, 'Frame Shape', 'Round'),
-- Product 22: Oakley Latch Beta Matte Grey (Oakley Rx)
(22, 'Frame Material', 'O Matter™'), (22, 'Frame Color', 'Matte Grey Ink'), (22, 'Feature', 'Latch Mechanism'), (22, 'Frame Shape', 'Round'),
-- Product 23: Persol PO3272S Green Lens (Persol)
(23, 'Frame Material', 'Acetate'), (23, 'Frame Color', 'Black'), (23, 'Lens Color', 'Green'), (23, 'Frame Shape', 'Square'),
-- Product 24: RB5154 Clubmaster Optics (Ray-Ban)
(24, 'Frame Material', 'Acetate & Metal'), (24, 'Frame Color', 'Black/Gold'), (24, 'Style', 'Browline'), (24, 'Bridge Type', 'Standard'),
-- Product 25: Oakley Clifden Prizm Snow (Oakley)
(25, 'Frame Material', 'O Matter™'), (25, 'Lens Technology', 'Prizm™ Snow'), (25, 'Features', 'Side Shields, Bridge Blocker, Leash'), (25, 'Sport', 'Mountaineering'),
-- Product 26: Gucci GG0811S Black Gold (Gucci)
(26, 'Frame Material', 'Metal & Acetate'), (26, 'Frame Color', 'Black/Gold'), (26, 'Lens Color', 'Grey'), (26, 'Style', 'Square'),
-- Product 27: Hexagonal Flat Lenses Gold (Ray-Ban)
(27, 'Frame Material', 'Metal'), (27, 'Frame Color', 'Gold'), (27, 'Lens Feature', 'Flat Lenses'), (27, 'Frame Shape', 'Hexagonal'),
-- Product 28: Oakley Turbine Rotor Prizm Deep Water (Oakley)
(28, 'Frame Material', 'O Matter™'), (28, 'Lens Technology', 'Prizm™ Deep Water Polarized'), (28, 'Style', 'Wrap'), (28, 'Sport', 'Water Sports'),
-- Product 29: Persol PO3160V Black (Persol)
(29, 'Frame Material', 'Acetate'), (29, 'Frame Color', 'Black'), (29, 'Frame Shape', 'Rectangle'), (29, 'Temple Feature', 'Arrow Hinge'),
-- Product 30: RB7140 Round Fleck Havana (Ray-Ban)
(30, 'Frame Material', 'Acetate & Metal'), (30, 'Frame Color', 'Havana Fleck/Gold'), (30, 'Frame Shape', 'Round'),
-- Product 31: Oakley Tie Bar Satin Black (Oakley Rx)
(31, 'Frame Material', 'Titanium'), (31, 'Frame Color', 'Satin Black'), (31, 'Style', 'Rimless'), (31, 'Feature', 'Lightweight'),
-- Product 32: Gucci GG0396O Havana (Gucci)
(32, 'Frame Material', 'Acetate'), (32, 'Frame Color', 'Havana'), (32, 'Frame Shape', 'Cat-Eye'), (32, 'Style', 'Fashion'),
-- Product 33: Aviator Large Metal II Gold (Ray-Ban)
(33, 'Frame Material', 'Metal'), (33, 'Frame Color', 'Gold'), (33, 'Lens Material', 'Crystal'), (33, 'Size', '62mm'),
-- Product 34: Oakley Gascan Matte Black Iridium (Oakley)
(34, 'Frame Material', 'O Matter™'), (34, 'Frame Color', 'Matte Black'), (34, 'Lens Coating', 'Iridium'), (34, 'Style', 'Wrap'),
-- Product 35: Persol PO0714 Folding Havana (Persol)
(35, 'Frame Material', 'Acetate'), (35, 'Frame Color', 'Havana'), (35, 'Feature', 'Foldable'), (35, 'Lens Type', 'Crystal'),
-- Product 36: RB2180 Round Havana (Ray-Ban)
(36, 'Frame Material', 'Acetate'), (36, 'Frame Color', 'Havana'), (36, 'Frame Shape', 'Round'), (36, 'Bridge Type', 'Keyhole'),
-- Product 37: Oakley Portal X Prizm Grey (Oakley)
(37, 'Frame Material', 'O Matter™'), (37, 'Lens Technology', 'Prizm™ Grey'), (37, 'Style', 'Lifestyle/Sport'), (37, 'Fit', 'Standard'),
-- Product 38: Gucci GG0631S Oversized Square (Gucci)
(38, 'Frame Material', 'Acetate'), (38, 'Frame Color', 'Black'), (38, 'Lens Color', 'Grey'), (38, 'Style', 'Oversized Square'),
-- Product 39: Wayfarer Ease Black (Ray-Ban)
(39, 'Frame Material', 'Acetate'), (39, 'Frame Color', 'Black'), (39, 'Feature', 'Thinner Frame'), (39, 'Style', 'Wayfarer'),
-- Product 40: Oakley Pitchman R Carbon (Oakley Rx)
(40, 'Frame Material', 'O Matter™ & Carbon Fiber'), (40, 'Frame Color', 'Satin Black'), (40, 'Frame Shape', 'Round'),
-- Product 41: Persol PO3263V Terra Di Siena (Persol)
(41, 'Frame Material', 'Acetate'), (41, 'Frame Color', 'Terra Di Siena'), (41, 'Frame Shape', 'Rectangle'),
-- Product 42: RB3548N Hexagonal Evolve Photochromic (Ray-Ban)
(42, 'Frame Material', 'Metal'), (42, 'Frame Color', 'Gold'), (42, 'Lens Feature', 'Photochromic Evolve'), (42, 'Frame Shape', 'Hexagonal'),
-- Product 43: Oakley Base Plane R Satin Black (Oakley Rx)
(43, 'Frame Material', 'Metal'), (43, 'Frame Color', 'Satin Black'), (43, 'Style', 'Minimalist Rectangle'),
-- Product 44: Gucci GG0407O Gold Metal (Gucci)
(44, 'Frame Material', 'Metal'), (44, 'Frame Color', 'Gold'), (44, 'Frame Shape', 'Square'), (44, 'Style', 'Classic'),
-- Product 45: New Wayfarer Matte Black (Ray-Ban)
(45, 'Frame Material', 'Nylon'), (45, 'Frame Color', 'Matte Black'), (45, 'Lens Color', 'Green G-15'), (45, 'Feature', 'Smaller Frame'),
-- Product 46: Oakley Jawbreaker Prizm Trail (Oakley)
(46, 'Frame Material', 'O Matter™'), (46, 'Lens Technology', 'Prizm™ Trail Torch'), (46, 'Feature', 'Switchlock™ Technology'), (46, 'Sport', 'Cycling/Trail'),
-- Product 47: Persol PO3210S Madreterra (Persol)
(47, 'Frame Material', 'Acetate'), (47, 'Frame Color', 'Madreterra'), (47, 'Lens Type', 'Crystal'), (47, 'Frame Shape', 'Square'),
-- Product 48: RB4165 Justin Rubberized Black (Ray-Ban)
(48, 'Frame Material', 'Nylon'), (48, 'Frame Color', 'Rubber Black'), (48, 'Lens Color', 'Grey Gradient'), (48, 'Frame Shape', 'Rectangle'),
-- Product 49: Oakley EVZero Blades Prizm Sapphire (Oakley)
(49, 'Frame Material', 'O Matter™'), (49, 'Lens Technology', 'Prizm™ Sapphire'), (49, 'Style', 'Rimless Shield'), (49, 'Feature', 'Ultra-Lightweight'),
-- Product 50: Gucci GG0726S Aviator Style (Gucci)
(50, 'Frame Material', 'Metal'), (50, 'Frame Color', 'Gold'), (50, 'Lens Color', 'Brown'), (50, 'Style', 'Aviator');

-- Insert Product Documents
INSERT INTO PRODUCT_DOCUMENT (product_id, original_filename, mime_type, file_content) VALUES
(1, 'manual_prod_1.pdf', 'application/pdf', 'Dummy Manual Content Product 1'),
(2, 'manual_prod_2.pdf', 'application/pdf', 'Dummy Manual Content Product 2'),
(3, 'warranty_prod_3.pdf', 'application/pdf', 'Dummy Warranty Content Product 3'),
(4, 'manual_prod_4.txt', 'text/plain', 'Dummy Manual Text Product 4'),
(5, 'manual_prod_5.pdf', 'application/pdf', 'Dummy Manual Content Product 5'),
(6, 'manual_prod_6.pdf', 'application/pdf', 'Dummy Manual Content Product 6'),
(7, 'warranty_prod_7.pdf', 'application/pdf', 'Dummy Warranty Content Product 7'),
(8, 'manual_prod_8.pdf', 'application/pdf', 'Dummy Manual Content Product 8'),
(9, 'manual_prod_9.pdf', 'application/pdf', 'Dummy Manual Content Product 9'),
(10, 'warranty_prod_10.txt', 'text/plain', 'Dummy Warranty Text Product 10'),
(11, 'manual_prod_11.pdf', 'application/pdf', 'Dummy Manual Content Product 11'),
(12, 'manual_prod_12.pdf', 'application/pdf', 'Dummy Manual Content Product 12'),
(13, 'warranty_prod_13.pdf', 'application/pdf', 'Dummy Warranty Content Product 13'),
(14, 'manual_prod_14.txt', 'text/plain', 'Dummy Manual Text Product 14'),
(15, 'manual_prod_15.pdf', 'application/pdf', 'Dummy Manual Content Product 15'),
(16, 'manual_prod_16.pdf', 'application/pdf', 'Dummy Manual Content Product 16'),
(17, 'warranty_prod_17.pdf', 'application/pdf', 'Dummy Warranty Content Product 17'),
(18, 'manual_prod_18.pdf', 'application/pdf', 'Dummy Manual Content Product 18'),
(19, 'manual_prod_19.pdf', 'application/pdf', 'Dummy Manual Content Product 19'),
(20, 'warranty_prod_20.txt', 'text/plain', 'Dummy Warranty Text Product 20'),
(21, 'manual_prod_21.pdf', 'application/pdf', 'Dummy Manual Content Product 21'),
(22, 'manual_prod_22.pdf', 'application/pdf', 'Dummy Manual Content Product 22'),
(23, 'warranty_prod_23.pdf', 'application/pdf', 'Dummy Warranty Content Product 23'),
(24, 'manual_prod_24.txt', 'text/plain', 'Dummy Manual Text Product 24'),
(25, 'manual_prod_25.pdf', 'application/pdf', 'Dummy Manual Content Product 25'),
(26, 'manual_prod_26.pdf', 'application/pdf', 'Dummy Manual Content Product 26'),
(27, 'warranty_prod_27.pdf', 'application/pdf', 'Dummy Warranty Content Product 27'),
(28, 'manual_prod_28.pdf', 'application/pdf', 'Dummy Manual Content Product 28'),
(29, 'manual_prod_29.pdf', 'application/pdf', 'Dummy Manual Content Product 29'),
(30, 'warranty_prod_30.txt', 'text/plain', 'Dummy Warranty Text Product 30'),
(31, 'manual_prod_31.pdf', 'application/pdf', 'Dummy Manual Content Product 31'),
(32, 'manual_prod_32.pdf', 'application/pdf', 'Dummy Manual Content Product 32'),
(33, 'warranty_prod_33.pdf', 'application/pdf', 'Dummy Warranty Content Product 33'),
(34, 'manual_prod_34.txt', 'text/plain', 'Dummy Manual Text Product 34'),
(35, 'manual_prod_35.pdf', 'application/pdf', 'Dummy Manual Content Product 35'),
(36, 'manual_prod_36.pdf', 'application/pdf', 'Dummy Manual Content Product 36'),
(37, 'warranty_prod_37.pdf', 'application/pdf', 'Dummy Warranty Content Product 37'),
(38, 'manual_prod_38.pdf', 'application/pdf', 'Dummy Manual Content Product 38'),
(39, 'manual_prod_39.pdf', 'application/pdf', 'Dummy Manual Content Product 39'),
(40, 'warranty_prod_40.txt', 'text/plain', 'Dummy Warranty Text Product 40'),
(41, 'manual_prod_41.pdf', 'application/pdf', 'Dummy Manual Content Product 41'),
(42, 'manual_prod_42.pdf', 'application/pdf', 'Dummy Manual Content Product 42'),
(43, 'warranty_prod_43.pdf', 'application/pdf', 'Dummy Warranty Content Product 43'),
(44, 'manual_prod_44.txt', 'text/plain', 'Dummy Manual Text Product 44'),
(45, 'manual_prod_45.pdf', 'application/pdf', 'Dummy Manual Content Product 45'),
(46, 'manual_prod_46.pdf', 'application/pdf', 'Dummy Manual Content Product 46'),
(47, 'warranty_prod_47.pdf', 'application/pdf', 'Dummy Warranty Content Product 47'),
(48, 'manual_prod_48.pdf', 'application/pdf', 'Dummy Manual Content Product 48'),
(49, 'manual_prod_49.pdf', 'application/pdf', 'Dummy Manual Content Product 49'),
(50, 'warranty_prod_50.txt', 'text/plain', 'Dummy Warranty Text Product 50');

-- Insert Users (password is 'password123' hashed with bcrypt)
INSERT INTO USERS (user_code, user_type, email, password_hash, full_name, phone_number, date_of_birth) VALUES
('USR001', 'admin', 'admin@persol.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin User', '0123456789', '1985-05-15'),
('USR002', 'customer', 'john.doe@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John Doe', '0987654321', '1990-08-20'),
('USR003', 'customer', 'jane.smith@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Jane Smith', '0912345678', '1995-03-12');

-- Insert Customers
INSERT INTO CUSTOMERS (user_id, customer_code) VALUES
(2, 'CUST001'),
(3, 'CUST002');

-- Insert Orders
INSERT INTO ORDERS (customer_id, order_code, order_status, total_amount, shipping_address, payment_method, payment_status, recipient_name, recipient_number, order_notes) VALUES
(1, 'ORD001', 'delivered', 645.00, '123 Main St, Ho Chi Minh City', 'Cash on Delivery', 'paid', 'John Doe', '0987654321', 'Please deliver in the afternoon'),
(2, 'ORD002', 'processing', 280.00, '456 Park Ave, Hanoi', 'Bank Transfer', 'pending', 'Jane Smith', '0912345678', 'Call before delivery');

-- Insert Order Items
INSERT INTO ORDER_ITEMS (order_id, product_id, quantity, unit_price, subtotal) VALUES
-- Order 1
(1, 1, 1, 350.00, 350.00),
(1, 3, 1, 175.00, 175.00),
(1, 5, 1, 220.00, 220.00),

-- Order 2
(2, 6, 1, 280.00, 280.00);

INSERT INTO PRODUCT_SPECIFICATIONS (product_id, spec_name, spec_value) VALUES
-- Persol PO0649 (product_id = 1)
(1, 'Lens Width', '54mm'),
(1, 'Bridge Width', '20mm'),
(1, 'Temple Length', '140mm'),
(1, 'Frame Material', 'Acetate'),
(1, 'Lens Type', 'Crystal'),
(1, 'UV Protection', '100%'),

-- Persol PO3019S (product_id = 2)
(2, 'Lens Width', '55mm'),
(2, 'Bridge Width', '18mm'),
(2, 'Temple Length', '145mm'),
(2, 'Frame Material', 'Acetate'),
(2, 'Lens Type', 'Polarized'),
(2, 'UV Protection', '100%'),

-- Ray-Ban RB2140 (product_id = 3)
(3, 'Lens Width', '50mm'),
(3, 'Bridge Width', '22mm'),
(3, 'Temple Length', '150mm'),
(3, 'Frame Material', 'Acetate'),
(3, 'Lens Type', 'G-15'),
(3, 'UV Protection', '100%'),

-- Ray-Ban RB3025 (product_id = 4)
(4, 'Lens Width', '58mm'),
(4, 'Bridge Width', '14mm'),
(4, 'Temple Length', '135mm'),
(4, 'Frame Material', 'Metal'),
(4, 'Lens Type', 'Crystal Green'),
(4, 'UV Protection', '100%'),

-- Oakley Flak 2.0 XL (product_id = 5)
(5, 'Lens Width', '59mm'),
(5, 'Bridge Width', '12mm'),
(5, 'Temple Length', '133mm'),
(5, 'Frame Material', 'O Matter'),
(5, 'Lens Type', 'Prizm'),
(5, 'UV Protection', '100%'),

-- Persol PO3007V (product_id = 6)
(6, 'Lens Width', '49mm'),
(6, 'Bridge Width', '22mm'),
(6, 'Temple Length', '145mm'),
(6, 'Frame Material', 'Acetate'),
(6, 'Frame Shape', 'Round'),
(6, 'Spring Hinges', 'Yes');