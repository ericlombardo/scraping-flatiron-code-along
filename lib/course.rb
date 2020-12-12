class Course
  attr_accessor :title, :schedule, :description # designate all the info you will need

  @@all = []

  def initialize  # push each instance to @@all array
    @@all << self
  end
    
  def self.all  # getter for @@all array
    @@all
  end

  def self.reset_all   # clear all in @@all array
    @@all.clear
  end
end

