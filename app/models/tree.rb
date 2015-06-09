require 'open-uri'
require 'nokogiri'
class Tree < ActiveRecord::Base

  def initialize(word, iso)
    @iso = iso
    @word = word
  end 
  
  def auto
    uri = URI.parse(URI.encode("http://suggestqueries.google.com/complete/search?output=toolbar&hl=en&q=#{@word}&gl=#{@iso}").strip)
    xml = uri.read
    response = Crack::XML.parse(xml)
  end 

end
