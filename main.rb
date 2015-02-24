require 'sinatra'
require 'pry'
require 'sqlite3'
DATABASE = SQLite3::Database.new('garden_selector.db')
require_relative 'database/db_setup'
require_relative 'database/database_methods'
require_relative 'models/category'
require_relative 'models/plant'
require_relative 'models/comment'
require_relative 'models/garden'
require_relative 'models/selection'
require_relative 'models/special_note'
require_relative 'controllers/index_controller.rb'
require_relative 'controllers/plants_controller.rb'
require_relative 'controllers/gardens_controller.rb'


# include Helper

# person = params["my_name
#  "Hello, #{person}"

