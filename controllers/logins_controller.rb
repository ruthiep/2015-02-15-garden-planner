get "/login" do
  erb  :"logins/new"
end

get "/try_login"  do  
  user = User.find_by_email(params[:email])
  
  if user
    
    if BCrypt::Password.new(user.password) == params[:password]
      session[:user_id] = user_id
      
      # redirect "/products"  need to choose valid paths
    else 
      # redirect "/login"
    end
  else 
    # redirect "/login"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/welcome"   #or another path??
end