# Class: Category
#
# Category of plant based on where it grows best in the garden.
#
# Attributes:
# @options         - Hash: stores the information about each product, including:
#  
# @name            - The name of the product.      
#
#
# Public Methods:
# #
# #
# #
# #
# #
# 

class Category
  include DatabaseMethods
  extend ClassMethods
  attr_reader :id
  attr_accessor  :name
   
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    
  end
     
end#classend