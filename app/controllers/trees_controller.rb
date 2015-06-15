class TreesController < ApplicationController
  def home
  end

  def create

    @word = params["query"]
    
    @iso1=params["location1"].split(", ")[0]
    @location1 = params["location1"].split(", ")[1]
    tree1 = Tree.new(@word, @iso1)
    @auto1 = tree1.auto
    # @hash1 = tree1.auto
    # @auto1 = []
    
    # @hash1["toplevel"]["CompleteSuggestion"].each do |hash|
    #    @auto1 << hash["suggestion"]["data"]
    # end  

    unless params["location2"]=="none"
      @iso2=params["location2"].split(", ")[0]
      @location2 = params["location2"].split(", ")[1]
      tree2 = Tree.new(@word, @iso2)
      @auto2 = tree2.auto
      # @auto2 = []
      # @hash2["toplevel"]["CompleteSuggestion"].each do |hash|
      #   @auto2 << hash["suggestion"]["data"]
      # end 
      @auto3 = Tree.overlap(@auto1,@auto2)
      binding.pry

    end 

    @root = params["query"].split(" ").first

  end 

end
