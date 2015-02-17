DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT NOT NULL)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS plants (id INTEGER PRIMARY KEY,
                  name TEXT NOT NULL UNIQUE, sun TEXT, more_info TEXT, picture TEXT, 
                  category_id INTEGER, FOREIGN_KEY(category_id) REFERENCES categories(id))")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS comments (id INTEGER PRIMARY KEY,
                 name TEXT NOT NULL)")
                 
DATABASE.execute("CREATE TABLE IF NOT EXISTS gardens (id INTEGER PRIMARY KEY,
                 name TEXT NOT NULL)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS selections (id INTEGER PRIMARY KEY, 
                  plant_id INTEGER, garden_id INTEGER,
                  FOREIGN KEY(plant_id) REFERENCES plants(id),
                  FOREIGN KEY(garden_id) REFERENCES gardens(id))")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS special_notes (id INTEGER PRIMARY KEY, 
                  plant_id INTEGER, comment_id INTEGER,
                  FOREIGN KEY(plant_id) REFERENCES plants(id),
                  FOREIGN KEY(comment_id) REFERENCES comments(id))")                
                  
                  
if DATABASE.execute("SELECT * FROM categories") == []              
  categories = ["Ground Cover", "Front", "Middle", "Back"]
  categories.each do|category|
    DATABASE.execute("INSERT INTO categories (name) VALUES ('#{category}')")
  end
end