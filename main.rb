require "sinatra"
require 'pry'
require 'sqlite3'
DATABASE = SQLite3::Database.new('garden_selector.db')
# require_relative "db_setup"
# require_relative "database_methods"
# require_relative 'plant'
# require_relative 'comment'
# require_relative 'category'
# require_relative "garden"
# require_relative 'selection'
# require_relative 'special_note'


# include Helper

# person = params["my_name
#  "Hello, #{person}"

get "/" do
  erb :welcome, :layout=> :boilerplate
end