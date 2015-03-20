require 'rubygems'
require 'bundler/setup'

require 'pry'
require 'sinatra'
require 'sinatra/activerecord'

enable :sessions

require 'bcrypt'
require 'json'

require 'twilio-ruby'


# require_relative 'database/database_methods'
require_relative 'database/db_setup'

require_relative 'models/category'
require_relative 'models/user'
require_relative 'models/plant'
require_relative 'models/garden'
require_relative 'models/selection'
require_relative 'models/comment'
require_relative 'models/special_note'

require_relative 'controllers/index_controller'
require_relative 'controllers/plants_controller'
require_relative 'controllers/gardens_controller'
require_relative 'controllers/logins_controller'
require_relative 'controllers/users_controller'


# include Helper

# account_sid = 'AC0f8ce07b36ea806570dc7948778a6437'
# auth_token = '9ec2512fea25ee73ddfc0f4556a12a8b'
#
# @client = Twilio::REST::Client.new account_sid, auth_token
#
# @client.account.messages.create({
#   :from => '+14024034837',
#   :to => '+14024907554',
#   :body => "Hey, someone just liked your garden, #{gardens.name}!"
# })

