# Class: Plant
#
# The list of plants in the database and information about each.
#
# Attributes:
# @options         - Hash: stores the information about each product, including:
#  
# @name            - The name of the product.
# @sun             - The amount of sun the plant prefers.
# @more_info       - A link to more information on the plant.
# @picture         - A link to a photo of the plant.
# @category_id     - The category to which the plant belongs.
#
#
# Public Methods:
# #edit_record
# #save
# #
# #
# #
# #
# #
# 

class Plant
  include DatabaseMethods
  extend ClassMethods
  attr_reader :id, :name, :sun, :more_info, :picture, :category_id
   
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @sun = options["sun"]
    @more_info = options["more_info"]
    @picture = options["picture"]
    @category_id = options["category_id"]
  end
     
end#classend