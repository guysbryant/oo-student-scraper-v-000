require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    @index_doc = Nokogiri::HTML(open(index_url))
    students = @index_doc.search("div.student-card").collect do |student|
      {
        :name => student.search("h4.student-name")[0].text,
        :location => student.search("p.student-location")[0].text,
        :profile_url => student.search("a")[0].attribute("href").value
        
      }
    end
    # Student.create_from_collection(students)
  end
  
 

  def self.scrape_profile_page(profile_url)
    @profile_doc = Nokogiri::HTML(open(profile_url))
  end

end

