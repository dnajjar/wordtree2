require 'open-uri'
class Tree < ActiveRecord::Base

  def initialize(word)
    @word = word
  end 
  
  def auto
    uri = URI.parse(URI.encode("http://suggestqueries.google.com/complete/search?client=firefox&q=#{@word}").strip)
    uri.read
  end 

end
