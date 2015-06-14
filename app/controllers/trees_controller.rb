class TreesController < ApplicationController
 
 def home

 end
  
  def create
    @word = params["query"]
    @iso1=params["location1"].split(", ")[0]
    @location1 = params["location1"].split(", ")[1]
    @iso2=params["location2"].split(", ")[0]
    @location2 = params["location2"].split(", ")[1]
    @root = params["query"].split(" ").first
    tree1 = Tree.new(@word, @iso1)
    tree2 = Tree.new(@word, @iso2)
    @hash1 = tree1.auto
    @auto1 = []
    @hash2 = tree2.auto
    @auto2 = []
    
    @hash1["toplevel"]["CompleteSuggestion"].each do |hash|
       @auto1 << hash["suggestion"]["data"]
    end 
     @hash2["toplevel"]["CompleteSuggestion"].each do |hash|
       @auto2 << hash["suggestion"]["data"]
    end 

  end 

end
