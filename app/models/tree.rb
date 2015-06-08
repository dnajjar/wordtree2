require 'open-uri'
class Tree < ActiveRecord::Base

  def initialize(word)
    @word = word
  end 
  
  def auto
    uri = URI.parse("http://suggestqueries.google.com/complete/search?client=firefox&q=#{@word}&num=15")
    uri.read
  end 

end
