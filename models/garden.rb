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

class Garden
  include DatabaseMethods
  extend ClassMethods
  
  attr_reader :id
  attr_accessor  :name

   
  def initialize(options)
    @id = options["id"]
    @name = options["name"]

  end
  
  def self.join_search(garden_id)
   results = DATABASE.execute("SELECT gardens.name AS garden_name, plants.name AS plant_name FROM selections 
    LEFT JOIN gardens ON selections.garden_id = gardens.id 
    LEFT JOIN plants ON selections.plant_id = plants.id WHERE selections.garden_id = #{garden_id}")
  end   
end#classend