# Class: Plant
#
# The list of plants in the database and information about each.
#
# Attributes:
# @options         - Hash: stores the information about each product, including:
#  
# @name            - The name of the product.
# @sun             - The amount of sun the plant prefers.
# @picture         - A link to a photo of the plant.
# @category_id     - The category to which the plant belongs.
#
#
# Public Methods:
# #
# #
# 

class Plant < ActiveRecord::Base
  
  belongs_to :category
  has_many :selections
  has_many :gardens, through: :selections  

end
  
  # include DatabaseMethods
 #  extend ClassMethods
 #  attr_reader :id, :name, :sun, :picture, :category_id
   
  # def initialize(options)
#     @id = options["id"]
#     @name = options["name"]
#     @sun = options["sun"]
#     @picture = options["picture"]
#     @category_id = options["category_id"]
#   end
     