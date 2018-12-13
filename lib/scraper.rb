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
    
    #twitter_url
    #linkedin_url
    #github_rul
    #blog_url
    # social_nodes.each_with_index{|node, index| b.push(node.attributes['href'].value) if index.odd?}
    # social urls @profile_doc.search("div.social-icon-container")[0].children.[odd].attributes["href"].value
    #profile_quote @profile_doc.search("div.profile-quote").text
    #bio @profile_doc.search("div.details-container div.descriptio-holder p").text
    binding.pry 
  end

end

