class User < ActiveRecord::Base
  # include BCrypt
  
  has_many :gardens
  
  # validates :name, presense: true,
#             length: { minimum: 5, too_short: "must be at least 5 characters long" }
end