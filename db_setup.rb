DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT NOT NULL)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS plants (id INTEGER PRIMARY KEY,
                  name TEXT NOT NULL, sun TEXT, more_info TEXT, picture TEXT,
                  category_id INTEGER, FOREIGN KEY(category_id) REFERENCES categories(id))")

DATABASE.execute("CREATE TABLE IF NOT EXISTS comments (id INTEGER PRIMARY KEY,
                 name TEXT NOT NULL)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS gardens (id INTEGER PRIMARY KEY,
                 name TEXT NOT NULL)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS selections (plant_id INTEGER NOT NULL, 
                  garden_id INTEGER NOT NULL,
                  PRIMARY KEY (plant_id, garden_id),
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
    DATABASE.execute("INSERT INTO plants (name, sun, more_info, picture, category_id)
    VALUES 
    ('Foxglove', 'Part Shade', 'link', 'picture', 4),
    ('Creeping Phlox', 'Full Sun', 'link', 'picture', 1),
    ('Thyme', 'Full Sun', 'link', 'picture', 1),
    ('Angelina Sedum', 'Full Sun', 'link', 'picture', 1),
    ('Cornflower', 'Full Sun', 'link', 'picture', 4)
    ('Arctic Fire', 'Full Sun-Part Shade', 'link', 'picture', 2),
    ('Ruby Glow Sedum', 'Full Sun-Part Shade', 'link', 'picture', 2),
    ('Mexican Blue Sage', 'Full Sun', 'link', 'picture', 2),
    ('Coneflower', 'Full Sun', 'link', 'picture', 3),
    ('Cupplant', 'Full Sun', 'linl', 'picture', 3),
    ('Meadow Sage salvia', 'Full Sun', 'link', 'picture', 3)")
 end

    # "en.wikipedia.org/wiki/Digitalis",
 #    "http://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Digitalis_purpurea2.jpg/220px-Digitalis_purpurea2.jpg",
 #    4)")
