namespace :fact do
  desc "TODO"
  require 'nokogiri'
  require 'open-uri'
  task fetch_facts: :environment do
    doc = Nokogiri::HTML(open('http://www.chucknorrisjokes.linkpress.info/facts.php'))
    doc.css('#content div p').each do |fact|
      Fact.create(body: fact.content)
      # puts fact.content
    end
    (2..257).each do |i|
      doc = Nokogiri::HTML(open("http://www.chucknorrisjokes.linkpress.info/facts.php?page=#{i}"))
      doc.css('#content div p').each do |fact|
        Fact.create(body: fact.content)
        # puts fact.content
        puts i
      end
    end
  end

end
