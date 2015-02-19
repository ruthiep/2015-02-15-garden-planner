require 'sinatra'
require 'pry'
require 'sqlite3'
DATABASE = SQLite3::Database.new('garden_selector.db')
require_relative 'db_setup'
require_relative 'database_methods'
require_relative 'models/category'
require_relative 'models/plant'
require_relative 'models/comment'
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

get "/cat_select" do  
  erb :category_info, :layout=> :boilerplate
end

get "/view_by_category" do
  @plant = Plant.search_where(params["table"], params["search_for"], params["user_search"])
  erb :plants_by_category, :layout=> :boilerplate
end

get "/view_garden" do
  @garden = Garden.all(params["table"])
  erb :show_garden, :layout=> :boilerplate
end

get "/select" do

  
  erb :select_garden, :layout=> :boilerplate
end

get "/create_garden" do
  erb :new_garden, :layout=> :boilerplate
end

get "/save_to_garden" do
  @gard = DATABASE.execute("INSERT INTO gardens (name) VALUES (params["name"])");
  erb :save_garden, :layout=> :boilerplate
end