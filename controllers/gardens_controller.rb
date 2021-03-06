get "/show_show_garden" do
  @garden = Garden.all
  # @garden = Garden.all(params["table"])
  erb :"gardens/show_garden", :layout=> :boilerplate
end

get "/show_select_garden" do
  @garden_list = Garden.join_search(params["garden_id"])
  @garden_id = params["garden_id"]
  erb :"gardens/select_garden", :layout=> :boilerplate
end

get "/show_new_garden" do
  erb :"gardens/new_garden", :layout=> :boilerplate
end

post "/show_confirm_new_garden" do
  
  user_id = session[:user_id]
  @new_garden = Garden.new(params)
  @new_garden.user_id = user_id
  @new_garden.save
  # @new_garden.insert("gardens")
  @gard = Garden.all
  # @gard = Garden.all(params["table"])
  erb :"gardens/confirm_new_garden", :layout=> :boilerplate
end

get "/show_save_garden" do
  @results = Selection.where_id_is(params["user_search"])
  # @results = Selection.search_where(params["table"], params["search_for"], params["user_search"])
  @plant = Plant.all
  # @plant = Plant.all(params["table"])
  @new_garden = Garden.new(params)
  @new_garden.save
  # @new_garden.insert("gardens")
  @gard = Garden.all
  # @gard = Garden.all(params["table"])
  erb :"gardens/save_garden", :layout=> :boilerplate
end

get "/show_like_garden" do
  @liked = Garden.find(params["garden_id"])
  # @liked = Garden.find("gardens", params["garden_id"])
  @liked.likes +=1
  @liked.save
  # @liked.save("gardens")
  erb :"gardens/like_garden", :layout=> :boilerplate
end

