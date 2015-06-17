class TreesController < ApplicationController
  def home
  end

  def create

    @word = params["query"]
    @auto1 =get_auto_from_query(location1, @word)

    # @iso1=params["location1"].split(", ")[0]
    # @location1 = params["location1"].split(", ")[1]
    # tree1 = Tree.new(@word, @iso1)
    # @auto1 = tree1.auto
    # @hash1 = tree1.auto
    # @auto1 = []
    
    # @hash1["toplevel"]["CompleteSuggestion"].each do |hash|
    #    @auto1 << hash["suggestion"]["data"]
    # end  

    unless params["location2"]=="none"
      @auto2=get_auto_from_query(location2, @word)
      # @iso2=params["location2"].split(", ")[0]
      # @location2 = params["location2"].split(", ")[1]
      # tree2 = Tree.new(@word, @iso2)
      # @auto2 = tree2.auto
      # # @auto2 = []
      # @hash2["toplevel"]["CompleteSuggestion"].each do |hash|
      #   @auto2 << hash["suggestion"]["data"]
      # end 
      @auto3 = Tree.overlap(@auto1,@auto2)

    end 

    @root = params["query"].split(" ").first

  end 

  def get_auto_from_query(location, word)

    @iso1=params["#{location}"].split(", ")[0]
    @location1 = params["#{location}"].split(", ")[1]
    tree1 = Tree.new(@word, @iso1)
    @auto1 = tree1.auto
    
  end

end
