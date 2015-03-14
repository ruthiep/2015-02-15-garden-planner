DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT NOT NULL)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS plants (id INTEGER PRIMARY KEY,
                  name TEXT NOT NULL, sun TEXT, picture TEXT,
                  category_id INTEGER, FOREIGN KEY(category_id) REFERENCES categories(id))")

DATABASE.execute("CREATE TABLE IF NOT EXISTS comments (id INTEGER PRIMARY KEY,
                 name TEXT NOT NULL)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS gardens (id INTEGER PRIMARY KEY,
                 name TEXT NOT NULL, likes INTEGER DEFAULT 1)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS selections (id INTEGER PRIMARY KEY,
                  quantity INTEGER, 
                  plant_id INTEGER,
                  garden_id INTEGER,
                  FOREIGN KEY (plant_id) REFERENCES plants(id),
                  FOREIGN KEY (garden_id) REFERENCES gardens(id))")

DATABASE.execute("CREATE TABLE IF NOT EXISTS special_notes (plant_id INTEGER NOT NULL,
                  comment_id INTEGER NOT NULL,
                  PRIMARY KEY (plant_id, comment_id),
                  FOREIGN KEY(plant_id) REFERENCES plants(id),
                  FOREIGN KEY(comment_id) REFERENCES comments(id))")


if DATABASE.execute("SELECT * FROM categories") == []
  categories = ["Ground Cover", "Front", "Middle", "Back"]
  categories.each do|category|
    DATABASE.execute("INSERT INTO categories (name) VALUES ('#{category}')")
  end
end

if DATABASE.execute("SELECT * FROM plants") == []
    DATABASE.execute("INSERT INTO plants (name, sun, picture, category_id)
    VALUES 
    ('Foxglove', 'Part Shade', '/images/foxglove.jpg', 4),
    ('Creeping Phlox', 'Full Sun', '/images/creeping_phlox.jpg', 1),
    ('Thyme', 'Full Sun', '/images/Thyme.jpg', 1),
    ('Angelina Sedum', 'Full Sun', '/images/angelina_sedum.jpg', 1),
    ('Cornflower', 'Full Sun', '/images/cornflower.jpg', 4),
    ('Arctic Fire', 'Full Sun-Part Shade', '/images/dianthus_arctic_fire.jpg', 2),
    ('Ruby Glow Sedum', 'Full Sun-Part Shade', '/images/rubyglow_sedum.jpg', 2),
    ('Mexican Blue Sage', 'Full Sun', '/images/mexican_bluesage.jpg', 2),
    ('Coneflower', 'Full Sun', '/images/coneflower.jpg', 3),
    ('Cupplant', 'Full Sun', '/images/CupPlant.jpg', 3),
    ('Meadow Sage salvia', 'Full Sun', '/images/meadow_sage_salvia.jpg', 3),
    ('Sweet Woodruff', 'Full Sun', '/images/sweet_woodruff.jpg', 1),
    ('Brass Buttons', 'Full Sun', '/images/brass_buttons.jpg', 1),
    ('Hibiscus', 'Full Sun-Part Shade', '/images/hibiscus.jpg', 4),
    ('Bishops Weed', 'Shade', '/images/bishops_weed.jpg', 1),
    ('Lavender', 'Full Sun', '/images/lavender.jpg', 2),
    ('Coralbells', 'Sun-Part Shade', '/images/coralbells.jpg', 2),
    ('Sage', 'Full Sun', '/images/purple_sage.jpg', 2),
    ('Zinnia', 'Full Sun', '/images/zinnia.jpg', 3),
    ('Bleeding Hearts', 'Part Shade', '/images/bleedingheart.jpg', 3),
    ('Daylily', 'Full Sun', '/images/daylily.jpg', 3),
    ('Hydrangea', 'Part Shade', '/images/Hydrangea.jpg', 4),
    ('Oleander', 'Full Sun', '/images/oleander.jpg', 4),
    ('Rhododendron', 'Full Sun', '/images/Rhododendron.jpg', 4)")  
  end
