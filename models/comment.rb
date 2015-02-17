# Class: Comment
#
# Special things to know about the plant.
#
# Attributes:
# @options         - Hash: stores the information about each product, including:
#  
# @comment            - The comment of the plant.
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

class Comment
  include DatabaseMethods
  extend ClassMethods
  attr_reader :id, :name,
   
  def initialize(options)
    @id = options["id"]
    @comment = options["comment"]
 
  end
     
end#classend