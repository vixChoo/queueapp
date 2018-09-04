desc "Testing for railscast fetch price & items" #just a description
task :fetch_prices => :environment do
    require 'nokogiri'
    require 'open-uri'

    url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=batman&Find.x=0&Find.y=0&Find=Find"
    doc = Nokogiri::HTML(open(url))
    puts doc.at_css("title").text
    doc.css(".item").each do |item|
    title = item.at_css(".prodLink").text
    price = item.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/\$[0-9\.]+/]
    puts "#{title} - #{price}"
    puts item.at_css(".prodLink")[:href]
    end
    
end



desc "Fetch product prices"
task :fetch_prices => :environment do
  require 'nokogiri'
  require 'open-uri'
  
  Product.find_all_by_price(nil).each do |product|
    url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=#{CGI.escape(product.name)}&Find.x=0&Find.y=0&Find=Find"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/[0-9\.]+/]
    product.update_attribute(:price, price)
  end
end

#--> the SelectorGadget --> is inspector so we dont hv to install that!! 
# all it does is just inspect the classes so we can extract it according to its class or id
# remember IT