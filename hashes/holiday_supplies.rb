# Author: Manuel Neuhauser
# Date : 9/30/2013
# Email: manuel.neuhauser@flatironschool.com
 
holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :forth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}



#  1. How would you access the second supply for the forth_of_july? ex: holiday_supplies[:spring][:memorial_day][0]

    puts holiday_supplies[:summer][:forth_of_july][1]


#  2. Add a supply to a Winter holiday.
    
    holiday_supplies[:winter][:new_years] << "Fireworks"


#  3. Add a supply to memorial day.

    holiday_supplies[:spring][:memorial_day] << "American Flag"


#  4. Add a new holiday to any season with supplies.

    holiday_supplies[:summer][:cinco_de_mayo] = ["Cerveza", "Guacamole", "Tortillas"]


#  5. Write a method to collect all Winter supplies from all the winter holidays. ex: winter_suppliers(holiday_supplies) #=> ["Lights", "Wreath", etc]
    
    holiday_supplies[:winter].collect do |_, supplies|
      supplies
    end.flatten


#  6. Write a loop to list out all the supplies you have for each holiday and the season.

    holiday_supplies.each do |season, holidays|
      puts "#{season.capitalize}:"
      holidays.each do |holiday, supplies|
        titleize_holiday = holiday.to_s.gsub(/((^[a-z])|(_[a-z]))/) { $1.upcase.sub('_', ' ') }
        puts " #{titleize_holiday}: #{supplies.join(' and ')}" 
      end
    end


# 7. Write a method to collect all holidays with BBQ.

  def holidays_with_bbqs(holiday_supplies) #=> [:fourth_of_july, :memorial_day]
    holiday_supplies.map do |season, holidays|
      holidays.map do |holiday, supplies|
        holiday if supplies.include?('BBQ')
      end
    end.flatten.compact
  end




