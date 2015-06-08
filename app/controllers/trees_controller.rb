require 'pry'
class TreesController < ApplicationController
 
 def home

 end
  
  def create
    @word = params["query"]
    @root = params["query"].split(" ").first
    tree = Tree.new(tree_params)
    @array = tree.auto
    @legit = eval(@array)[1]
  end 

  private
  def tree_params
    params.require(:query)
  end 
end
