require 'sinatra'
require 'pry'
require 'sqlite3'
DATABASE = SQLite3::Database.new('garden_selector.db')
require_relative 'db_setup'
require_relative 'database_methods'
require_relative 'models/category'
require_relative 'models/plant'
require_relative 'models/comment'
require_relative 'models/search'
require_relative 'models/garden'
require_relative 'models/selection'
require_relative 'models/special_note'


# include Helper

# person = params["my_name
#  "Hello, #{person}"

get "/" do
  erb :welcome, :layout=> :boilerplate
end

get "/plant_search"  do
  @plant = Plant.all(params["table"])
  erb :search_plants, :layout=> :boilerplate
end