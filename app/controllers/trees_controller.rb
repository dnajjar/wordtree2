class TreesController < ApplicationController
  def home
  end

  def create

    @word = params["query"]
    # @auto1 =get_auto_from_query(location1, @word)

    @iso1=params["location1"].split(", ")[0]
    @location1 = params["location1"].split(", ")[1]
    tree1 = Tree.new(@word, @iso1)
    @auto1 = tree1.auto
    # @hash1 = tree1.auto
    # @auto1 = []
    
    # @hash1["toplevel"]["CompleteSuggestion"].each do |hash|
    #    @auto1 << hash["suggestion"]["data"]
    # end  
      if params["location2"]
      unless params["location2"]=="none"
        # @auto2=get_auto_from_query(location2, @word)
        @iso2=params["location2"].split(", ")[0]
        @location2 = params["location2"].split(", ")[1]
        tree2 = Tree.new(@word, @iso2)
        @auto2 = tree2.auto
        # # @auto2 = []
        # @hash2["toplevel"]["CompleteSuggestion"].each do |hash|
        #   @auto2 << hash["suggestion"]["data"]
        # end 
        @auto3 = Tree.overlap(@auto1,@auto2)

      end 
    end

    @root = params["query"].split(" ").first

  end 

  def random
    @word = ["why are", "who is","what is my", "where is my", "why should i", "how many times", "love is", "how do i know", "why is my"].sample
    @country1 = ["us, United States", "eg, Egypt", "kr, South-Korea", "sa, Saudi-Arabia", "in, India"].sample 
    @country2 =  @country1
      while @country2 == @country1
    @country2 = ["us, United States", "eg, Egypt", "kr, South-Korea", "sa, Saudi-Arabia", "in, India"].sample 
      end 
    @iso1 = @country1.split(", ")[0]
    @iso2 = @country2.split(", ")[0]
    @location1 = @country1.split(", ")[1]
    @location2 = @country2.split(", ")[1]
    tree1 = Tree.new(@word, @iso1)
    @auto1 = tree1.auto
    tree2 = Tree.new(@word, @iso2)
    @auto2 = tree2.auto
    @auto3 = Tree.overlap(@auto1,@auto2)
    @root = @word.split(" ").first

  end 
  def get_auto_from_query(location, word)

    @iso1=params["#{location}"].split(", ")[0]
    @location1 = params["#{location}"].split(", ")[1]
    tree1 = Tree.new(@word, @iso1)
    @auto1 = tree1.auto
    
  end

end
