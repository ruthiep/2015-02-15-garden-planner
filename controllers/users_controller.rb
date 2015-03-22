get "/show_new" do
  erb :"users/new", :layout=> :boilerplate
  
end


post "/show_confirm_new_user" do
 
  session[:user_id] = nil
  password_digest = BCrypt::Password.create(params[:password])
  params[:password] = password_digest

  @user = User.new
  @user.name = params["name"]
  # @user.email = params["email"]
  @user.password = params[:password]
  @user.save
  
  if @user.save
    session[:user_id] = @user.id
    redirect "/show_new_garden"
    
  else
    redirect "/"
  end
end

  
get "/user/:id" do
  @user = User.find(params[:id])
  erb :"users/show", :layout=> :boilerplate
end

# post "/show_confirm_new_garden" do
#   @new_garden = Garden.new(params)
#   @new_garden.save
#   # @new_garden.insert("gardens")
#   @gard = Garden.all  ##why do I have this line in here??
#   # @gard = Garden.all(params["table"])
#   erb :"gardens/confirm_new_garden", :layout=> :boilerplate
# end