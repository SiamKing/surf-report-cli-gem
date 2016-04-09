require_relative "../surf_report/scraper.rb"
require_relative "../surf_report/report.rb"
require 'colorize'

require 'pry'
class SurfReport::CLI

  def call
    make_days
    list_surf_reports
    menu
    goodbye
  end

  def make_days
    days_array = Scraper.scrape_index_page
    SurfReport::Report.create_from_collection(days_array)
  end

  def list_surf_reports
    puts "\n"
    puts "3 Day Surf Report for Los Angeles:".colorize(:black)
    puts "\n"
    @days = SurfReport::Report.all
    @days.each.with_index(1) do |day, i|
      puts "#{i}.".colorize(:magenta) + "#{day.date}".colorize(:black) + "- #{day.forecast.colorize(:blue)}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\n"
      puts "Enter the number of the day you would like to see a detailed report for or type 'list' to see days again or 'exit' to get outta here!"
      input = gets.strip.downcase

      if input.to_i > 0
        the_day = @days[input.to_i - 1]
        puts "\n"
        puts "The date you chose is #{the_day.date}".colorize(:red)
        puts "Wave Height : ".colorize(:cyan) + "#{the_day.wave_size.colorize(:black)}"
        puts "Wave Description: ".colorize(:cyan) + "#{the_day.wave_description.colorize(:black)}"
        puts "Swell Direction: ".colorize(:cyan) + "#{the_day.swell_direction.colorize(:black)}"
        puts "Surfer Dude says: ".colorize(:cyan) + "#{the_day.surfer_dude_says.colorize(:black)}"

      elsif input == "list"
        list_surf_reports
      elsif input == "exit"
        break
      else
        puts "\n"
        puts "Not sure what you want. Type list, number or exit."
      end
    end

  end

  def goodbye
    puts "Hope the waves are swell;)"
  end
end
