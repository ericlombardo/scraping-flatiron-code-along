# nokogiri allows you to create NodeSet from HTML and parse through XML elements
require 'nokogiri' 
# open-uri allows you to make HTML request like open the HTML file so you can collect it
require 'open-uri'
require 'pry'

require_relative './course.rb' # brings in Course class so you can create new courses

class Scraper
  
  def get_page  # gets page from website using Nokogiri and open-uri
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end  

  def get_courses # gets the XML elements will all the courses
    self.get_page.css(".post")
  end

  def make_courses                    # loops through each course creating new Course class and
    self.get_courses.each do |post|   # assigning title, schedule, and description
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end
  def print_courses # prints courses after they are created
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
end
Scraper.new.print_courses # call to print courses



