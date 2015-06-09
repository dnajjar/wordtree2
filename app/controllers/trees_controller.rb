class TreesController < ApplicationController
 
 def home

 end
  
  def create
    @word = params["query"]
    @iso = params["iso_code"]
    @root = params["query"].split(" ").first
    tree = Tree.new(@word, @iso)
    @hash = tree.auto
    @legit = []
    @hash["toplevel"]["CompleteSuggestion"].each do |hash|
       @legit << hash["suggestion"]["data"]
    end 
    # @legit = eval(@array)[1]
  end 

  # private
  # def tree_params
  #   # params.require(:query, :iso_code)
  # end 
end
