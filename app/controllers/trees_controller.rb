class TreesController < ApplicationController
 
 def home

 end
  
  def create
    @word = params["query"]
    @iso=params["Location"].split(", ")[0]
    @location = params["Location"].split(", ")[1]
    @root = params["query"].split(" ").first
    tree = Tree.new(@word, @iso)
    @hash = tree.auto
    @auto = []
    @hash["toplevel"]["CompleteSuggestion"].each do |hash|
       @auto << hash["suggestion"]["data"]
    end 
  end 

end
