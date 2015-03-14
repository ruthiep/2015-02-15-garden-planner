get "/" do
  
  erb :"welcome", :layout=> :boilerplate
end

# the original homepage
# get "/" do
#   erb :"welcome", :layout=> :boilerplate
# end