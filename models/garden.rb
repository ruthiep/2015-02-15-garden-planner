# Class: Garden
#
# Stores the plant selections.
#
# Attributes:
# @options         - Hash: stores the information about each product, including:
#  
# @name            - The name of the product.
#
# Public Methods:
# #
# #
# #
# 

class Garden < ActiveRecord::Base
  has_many :selections
  has_many :plants, through: :selections
  
  def self.join_search(garden_id)
   results = ActiveRecord::Base.connection.execute("SELECT quantity, gardens.name AS garden_name, plants.name AS plant_name FROM selections 
    LEFT JOIN gardens ON selections.garden_id = gardens.id 
    LEFT JOIN plants ON selections.plant_id = plants.id WHERE selections.garden_id 
    = #{garden_id}")
  end   
  
  def new_likes(garden_id)  
    @liked = Garden.find("gardens", '#{garden_id}') 
    @liked.likes +=1
    @liked.save("gardens")
  end
  
 
end#classend

  # include DatabaseMethods
  # extend ClassMethods
  #
  # attr_reader :id
  # attr_accessor  :name, :likes

   
  # def initialize(options)
#     @id = options["id"]
#     @name = options["name"]
#     if options["likes"] == nil
#       @likes = 1
#     else
#       @likes = options["likes"]
#     end
#   end