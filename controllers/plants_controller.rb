get "/show_save_plants" do
  @plant = Plant.find("plants", params["plant_id"]) 
  @garden = Garden.find("gardens", params["garden_id"]) 
  @new_selection = Selection.new(params)
  @new_selection.insert("selections")
  @garden_list = Garden.join_search(params["garden_id"])
  erb :"plants/save_plants", :layout=> :boilerplate
end

# get "/show_select_plants" do
#   @plant=Plant.all(params["table"])
#   @garden_id = params["garden_id"]
#   erb :"plants/select_plants", :layout=> :boilerplate
# end

#correct version with Sumeet
get "/show_select_plants/:garden_id" do
  @plant=Plant.all(params["table"])
  @garden_id = params[:garden_id]
  erb :"plants/select_plants", :layout=> :boilerplate
end

get "/show_search_plants"  do
  @plant = Plant.all(params["table"])
  erb :"plants/search_plants", :layout=> :boilerplate
end

get "/show_category_info" do  
  erb :"plants/category_info", :layout=> :boilerplate
end

get "/show_plants_by_category" do
  @plant = Plant.search_where(params["table"], params["search_for"], params["user_search"])
  erb :"plants/plants_by_category", :layout=> :boilerplate
end