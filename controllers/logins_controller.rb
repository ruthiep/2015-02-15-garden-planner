get "/show_login" do
  erb  :"logins/login"
end

post "/try_login"  do  
  user = User.find_by_name(params[:name])

  if user
    binding.pry    
    if BCrypt::Password.new(user.password) == params[:password]
      session[:user_id] = user.id
      
      redirect "/show_search_plants"
    else 
       redirect "/"
    end
  else 
     redirect "/"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"  
end