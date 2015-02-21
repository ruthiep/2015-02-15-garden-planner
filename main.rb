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

get "/show_search_plants"  do
  @plant = Plant.all(params["table"])
  erb :search_plants, :layout=> :boilerplate
end

get "/show_category_info" do  
  erb :category_info, :layout=> :boilerplate
end

get "/show_plants_by_category" do
  @plant = Plant.search_where(params["table"], params["search_for"], params["user_search"])
  erb :plants_by_category, :layout=> :boilerplate
end

get "/show_show_garden" do
  @garden = Garden.all(params["table"])
  erb :show_garden, :layout=> :boilerplate
end

get "/show_select_garden" do
  @garden_list = Garden.join_search(params["garden_id"])
  @garden_id = params["garden_id"]
  erb :select_garden, :layout=> :boilerplate
end

get "/show_new_garden" do
  erb :new_garden, :layout=> :boilerplate
end

get "/show_confirm_new_garden" do
  @new_garden = Garden.new(params)
  @new_garden.insert("gardens")
  @gard = Garden.all(params["table"]) 
  erb :confirm_new_garden, :layout=> :boilerplate
end

get "/show_save_garden" do
  @results = Selection.search_where(params["table"], params["search_for"], params["user_search"])
  @plant = Plant.all(params["table"])
  @new_garden = Garden.new(params)
  @new_garden.insert("gardens")
  @gard = Garden.all(params["table"])
  erb :save_garden, :layout=> :boilerplate
end

get "/show_save_plants" do
  @plant = Plant.find("plants", params["plant_id"]) 
  @garden = Garden.find("gardens", params["garden_id"]) 
  @new_selection = Selection.new(params)
  @new_selection.insert("selections")
  @garden_list = Garden.join_search(params["garden_id"])
  erb :save_plants, :layout=> :boilerplate
end

get "/show_select_plants" do
  @plant=Plant.all(params["table"])
  @garden_id = params["garden_id"]
  erb :select_plants, :layout=> :boilerplate
end