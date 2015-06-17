require 'open-uri'
require 'nokogiri'
class Tree < ActiveRecord::Base

  def self.overlap(array1, array2)
    array3 = array1.select do |value|
      array2.include?(value)
    end 
      array3
  end 

  def initialize(word, iso)
    @iso = iso
    @word = word
  end 
  
  def auto
    uri = URI.parse(URI.encode("http://suggestqueries.google.com/complete/search?output=toolbar&hl=en&q=#{@word}&gl=#{@iso}").strip)
    xml = uri.read
    response = Crack::XML.parse(xml)
    auto = []
      response["toplevel"]["CompleteSuggestion"].each do |hash|
        auto << hash["suggestion"]["data"]
      end 
      auto
  end 

  def get_auto_array(auto_hash)
     
    end

end
