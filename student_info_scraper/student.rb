# Author: Manuel Neuhauser
# Date : 10/6/2013
# Email: manuel.neuhauser@flatironschool.com

require "nokogiri"
require "open-uri"
require "awesome_print"
require "sqlite3"

class Student

  STUDENT_DATABASE_FILE = "students.db"
  INDEX_PAGE = "http://students.flatironschool.com/"

  attr_accessor :source, :flatiron_profile_link, :name, :profile_picture,
                :twitter_page, :github_page, :linkedin_page, :rss_feed,
                :student_quote, :biography, :education, :work, :treehouse,
                :code_school, :coder_wall, :blogs, :favorite_cities, 
                :favorites, :excerpt, :tag_line

  def initialize(name, link)
    @name = name
    @flatiron_profile_link = link
    @page_root = link.match(/http[s]?:\/\/([a-zA-Z.-]+)([^\/]*\/)*/).to_s
    scrape
  end

  def scrape
    begin
      self.source = Nokogiri::HTML(open(@flatiron_profile_link))
    rescue
      return false
      # Unable to access page (i.e. 404 error)
    end
    
    self.scrape_name if self.name.nil?
    self.scrape_profile_picture
    self.scrape_twitter_page
    self.scrape_github_page
    self.scrape_linkedin_page
    self.scrape_rss_feed
    self.scrape_student_quote
    self.scrape_biography
    self.scrape_education
    self.scrape_work
    self.scrape_treehouse
    self.scrape_code_school
    self.scrape_coder_wall
    self.scrape_blogs
    self.scrape_favorite_cities
    self.scrape_favorites

    true
  end

  def scrape_name
    if name_node = source.css(".ib_main_header")
      self.name = name_node.text.strip
    end
  end

  def scrape_profile_picture
    img_src = source.css(".student_pic").attr("src").text
    self.profile_picture = if img_src.match(/^https?:\/\//)
      img_src
    else
      @page_root + img_src
    end
  end

  def scrape_twitter_page
    if twitter_node = source.at_css(".page-title .icon-twitter")
      self.twitter_page = twitter_node.parent.attr("href")
    end
  end

  def scrape_github_page
    if github_node = source.at_css(".page-title .icon-github")
      self.github_page = github_node.parent.attr("href")
    end
  end

  def scrape_linkedin_page
    if linkedin_page_node = source.at_css(".page-title .icon-linkedin-sign")
      self.linkedin_page = linkedin_page_node.parent.attr("href")
    end
  end

  def scrape_rss_feed
    if rss_feed_node = source.at_css(".page-title .icon-rss")
      self.rss_feed = rss_feed_node.parent.attr("href")
    end
  end

  def scrape_student_quote
    self.student_quote = source.css(".page-title .textwidget").text.strip
  end

  def content_for(pattern)
    source.css("h3").each do |title_text| 
      if title_text.text.strip.match(pattern)
        return title_text.parent.parent.text.strip.sub(pattern, '').strip
      end
    end
    nil
  end

  def scrape_biography
    self.biography = content_for(/^Biography/i)
  end

  def scrape_education
    self.education = content_for(/^Education/i)
  end

  def scrape_work
    self.work = content_for(/^Work/i)
  end

  def scrape_treehouse
    if treehouse_node = source.at_css("img[alt='Treehouse']")
      self.treehouse = treehouse_node.parent.attr("href")
    end
  end

  def scrape_code_school
    if code_school_node = source.at_css("img[alt='Code School']")
      self.code_school = code_school_node.parent.attr("href")
    end
  end

  def scrape_coder_wall
    if coder_wall_node = source.at_css("img[alt='Coder Wall']")
      self.coder_wall = coder_wall_node.parent.attr("href")
    end
  end

  def scrape_blogs
    source.css("h3").each do |title_text| 
      if title_text.text.strip.downcase == "blogs"
        self.blogs = title_text.parent.parent.css("a").map do |link|
          "#{link.text} - #{link.attr('href')}"
        end.join("\n")
      end
    end
  end

  def scrape_favorite_cities
    source.css("h3").each do |title_text| 
      if title_text.text.strip.downcase == "favorite cities"
        self.favorite_cities = title_text.parent.parent.css("a").to_a.join("\n")
      end
    end
  end

  def scrape_favorites
    source.css("h3").each do |title_text| 
      if title_text.text.strip.downcase == "favorites"
        self.favorites = title_text.parent.parent.css("p").text.gsub(/^\s*- /,"")
      end
    end
  end

  def save
    
    #Student.create_table unless File.exists?(STUDENT_DATABASE_FILE)

    data = [
      self.flatiron_profile_link,
      self.name,
      self.profile_picture,
      self.twitter_page,
      self.github_page,
      self.linkedin_page,
      self.rss_feed,
      self.student_quote,
      self.biography,
      self.education,
      self.work,
      self.treehouse,
      self.code_school,
      self.coder_wall,
      self.blogs,
      self.favorite_cities,
      self.favorites,
      self.excerpt,
      self.tag_line
    ]

    db = SQLite3::Database.new STUDENT_DATABASE_FILE
    
    begin
      db.execute(
        "INSERT INTO students VALUES (NULL, #{(['?']*data.size).join ','})",
        data
      )
    rescue
      return false
    end

    true
  end


  def self.scrape_all

    Student.drop_table
    Student.create_table

    Nokogiri::HTML(open(INDEX_PAGE)).css(".home-blog-post").each do |student_data|
      link = student_data.css("a").attr("href").to_s  
      name = student_data.css("a").text.strip  

      student = Student.new(name, INDEX_PAGE + link) 
      student.tag_line = student_data.css(".home-blog-post-meta").text
      student.excerpt = student_data.css(".excerpt p").text
      student.save
    end    
  end


  def self.create_table
    db = SQLite3::Database.new STUDENT_DATABASE_FILE
    db.execute <<-SQL

    CREATE TABLE students (
      id INTEGER PRIMARY KEY,
      flatiron_profile_link TEXT,
      name TEXT,
      profile_picture TEXT,
      twitter_page TEXT,
      github_page TEXT,
      linkedin_page TEXT,
      rss_feed TEXT,
      student_quote TEXT,
      biography TEXT,
      education TEXT,
      work TEXT,
      treehouse TEXT,
      code_school TEXT,
      coder_wall TEXT,
      blogs TEXT,
      favorite_cities TEXT,
      favorites TEXT,
      excerpt TEXT,
      tag_line TEXT
      );      
    SQL
  end

  def self.drop_table
    db = SQLite3::Database.new STUDENT_DATABASE_FILE
    db.execute("DROP TABLE IF EXISTS students;")
  end
  
end


Student.scrape_all



