
unless ActiveRecord::Base.connection.table_exists?(:categories)
   ActiveRecord::Base.connection.create_table :categories do |t|
     t.text :name
   end
end

unless ActiveRecord::Base.connection.table_exists?(:plants)
   ActiveRecord::Base.connection.create_table :plants do |t|
     t.text :name
     t.text :sun
     t.text :picture
     t.belongs_to :category, index: true  
   end
end

unless ActiveRecord::Base.connection.table_exists?(:gardens)
   ActiveRecord::Base.connection.create_table :gardens do |t|
     t.text :name
     t.belongs_to :user
     t.integer :likes, :default => 1
    
    

   end
end

unless ActiveRecord::Base.connection.table_exists?(:selections)
   ActiveRecord::Base.connection.create_table :selections do |t|
     t.integer :quantity
     t.belongs_to :plant
     t.belongs_to :garden
   end
end

unless ActiveRecord::Base.connection.table_exists?(:users)
   ActiveRecord::Base.connection.create_table :users do |t|
     t.text :name
     t.text :email
     t.text :password
    
   end
end


# # comment out this section afer creating db the first time
#   Category.create([
#     {name: "Ground Cover"},
#     {name: "Front"},
#     {name: "Middle"},
#     {name: "Back"}
#
#     ])
#
# # comment out this section afer creating db the first time
# Plant.create([
#   {name: 'Foxglove', sun: 'Part Shade', picture: '/images/foxglove.jpg', category_id: 4},
#   {name: 'Creeping Phlox', sun: 'Full Sun', picture: '/images/creeping_phlox.jpg', category_id: 1},
#   {name: 'Thyme', sun: 'Full Sun', picture: '/images/Thyme.jpg', category_id: 1},
#   {name: 'Angelina Sedum', sun: 'Full Sun', picture: '/images/angelina_sedum.jpg', category_id: 1},
#   {name: 'Cornflower', sun: 'Full Sun', picture: '/images/cornflower.jpg', category_id: 4},
#   {name: 'Arctic Fire', sun: 'Full Sun-Part Shade', picture: '/images/dianthus_arctic_fire.jpg', category_id: 2},
#   {name: 'Ruby Glow Sedum', sun: 'Full Sun-Part Shade', picture: '/images/rubyglow_sedum.jpg', category_id: 2},
#   {name: 'Mexican Blue Sage', sun: 'Full Sun', picture: '/images/mexican_bluesage.jpg', category_id: 2},
#   {name: 'Coneflower', sun: 'Full Sun', picture: '/images/coneflower.jpg', category_id: 3},
#   {name: 'Cupplant', sun: 'Full Sun', picture: '/images/CupPlant.jpg', category_id: 3},
#   {name: 'Meadow Sage salvia', sun: 'Full Sun', picture: '/images/meadow_sage_salvia.jpg', category_id: 3},
#   {name: 'Sweet Woodruff', sun: 'Full Sun', picture: '/images/sweet_woodruff.jpg', category_id: 1},
#   {name: 'Brass Buttons', sun: 'Full Sun', picture: '/images/brass_buttons.jpg', category_id: 1},
#   {name: 'Hibiscus', sun: 'Full Sun-Part Shade', picture: '/images/hibiscus.jpg', category_id: 4},
#   {name: 'Bishops Weed', sun: 'Shade', picture: '/images/bishops_weed.jpg', category_id: 1},
#   {name: 'Lavender', sun: 'Full Sun', picture: '/images/lavender.jpg', category_id: 2},
#   {name: 'Coralbells', sun: 'Sun-Part Shade', picture: '/images/coralbells.jpg', category_id: 2},
#   {name: 'Sage', sun: 'Full Sun', picture: '/images/purple_sage.jpg', category_id: 2},
#   {name: 'Zinnia', sun: 'Full Sun', picture: '/images/zinnia.jpg', category_id: 3},
#   {name: 'Bleeding Hearts', sun: 'Part Shade', picture: '/images/bleedingheart.jpg', category_id: 3},
#   {name: 'Daylily', sun: 'Full Sun', picture: '/images/daylily.jpg', category_id: 3},
#   {name: 'Hydrangea', sun: 'Part Shade', picture: '/images/Hydrangea.jpg', category_id: 4},
#   {name: 'Oleander', sun: 'Full Sun', picture: '/images/oleander.jpg', category_id: 4},
#   {name: 'Rhododendron', sun: 'Full Sun', picture: '/images/Rhododendron.jpg', category_id: 4}
#
# ])

###### this is the old, pre-active record db setup####

# DATABASE.execute("CREATE TABLE IF NOT EXISTS comments (id INTEGER PRIMARY KEY,
#                  name TEXT NOT NULL)")

# DATABASE.execute("CREATE TABLE IF NOT EXISTS gardens (id INTEGER PRIMARY KEY,
#                  name TEXT NOT NULL, likes INTEGER DEFAULT 1)")

# DATABASE.execute("CREATE TABLE IF NOT EXISTS special_notes (plant_id INTEGER NOT NULL,
#                   comment_id INTEGER NOT NULL,
#                   PRIMARY KEY (plant_id, comment_id),
#                   FOREIGN KEY(plant_id) REFERENCES plants(id),
#                   FOREIGN KEY(comment_id) REFERENCES comments(id))")
    
# if DATABASE.execute("SELECT * FROM categories") == []
#   categories = ["Ground Cover", "Front", "Middle", "Back"]
#   categories.each do|category|
#         DATABASE.execute("INSERT INTO categories (name) VALUES ('#{category}')")
#   end
# end

# if DATABASE.execute("SELECT * FROM plants") == []
#     DATABASE.execute("INSERT INTO plants (name, sun, picture, category_id)
#     VALUES
#     ('Foxglove', 'Part Shade', '/images/foxglove.jpg', 4),
#     ('Creeping Phlox', 'Full Sun', '/images/creeping_phlox.jpg', 1),
#     ('Thyme', 'Full Sun', '/images/Thyme.jpg', 1),
#     ('Angelina Sedum', 'Full Sun', '/images/angelina_sedum.jpg', 1),
#     ('Cornflower', 'Full Sun', '/images/cornflower.jpg', 4),
#     ('Arctic Fire', 'Full Sun-Part Shade', '/images/dianthus_arctic_fire.jpg', 2),
#     ('Ruby Glow Sedum', 'Full Sun-Part Shade', '/images/rubyglow_sedum.jpg', 2),
#     ('Mexican Blue Sage', 'Full Sun', '/images/mexican_bluesage.jpg', 2),
#     ('Coneflower', 'Full Sun', '/images/coneflower.jpg', 3),
#     ('Cupplant', 'Full Sun', '/images/CupPlant.jpg', 3),
#     ('Meadow Sage salvia', 'Full Sun', '/images/meadow_sage_salvia.jpg', 3),
#     ('Sweet Woodruff', 'Full Sun', '/images/sweet_woodruff.jpg', 1),
#     ('Brass Buttons', 'Full Sun', '/images/brass_buttons.jpg', 1),
#     ('Hibiscus', 'Full Sun-Part Shade', '/images/hibiscus.jpg', 4),
#     ('Bishops Weed', 'Shade', '/images/bishops_weed.jpg', 1),
#     ('Lavender', 'Full Sun', '/images/lavender.jpg', 2),
#     ('Coralbells', 'Sun-Part Shade', '/images/coralbells.jpg', 2),
#     ('Sage', 'Full Sun', '/images/purple_sage.jpg', 2),
#     ('Zinnia', 'Full Sun', '/images/zinnia.jpg', 3),
#     ('Bleeding Hearts', 'Part Shade', '/images/bleedingheart.jpg', 3),
#     ('Daylily', 'Full Sun', '/images/daylily.jpg', 3),
#     ('Hydrangea', 'Part Shade', '/images/Hydrangea.jpg', 4),
#     ('Oleander', 'Full Sun', '/images/oleander.jpg', 4),
#     ('Rhododendron', 'Full Sun', '/images/Rhododendron.jpg', 4)")
#   end