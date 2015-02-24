# Class: Selection
#
# Associative table between plant and garden.
#
# Attributes:
# @options         - Hash: stores the information about each product, including:
#
# @plant_id        - The PK of the plant.
# @garden_id       - The PK of the garden.
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

class Selection
  include DatabaseMethods
  extend ClassMethods
  attr_reader :id
  attr_accessor :plant_id, :garden_id
   
   
   # are fk attr_accessors or attr_readers?
  def initialize(options)
    @id = options["id"]
    @plant_id = options["plant_id"]
    @garden_id = options["garden_id"]
  end
  
  # Public: .join_search
  # Does a join on the selections table to get the garden name and plant names, based on id.
  #
  # Parameters:
  # garden_id              - Integer:  the ID of the garden to be matched.
  #
  #
  # Returns:
  # returns the matching plant records for the specified ID.
  #
  # State changes:
  # none.
  

   
     
end#classend