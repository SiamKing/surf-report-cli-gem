require_relative "../surf_report/scraper.rb"
require_relative "../surf_report/report.rb"
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
    binding.pry
  end

  def list_surf_reports
    puts "3 Day Surf Report for Los Angeles:"
    puts "\n"
    @days = SurfReport::Report.today
    @days.each.with_index(1) do |day, i|
      puts "#{i}. #{day.date} - #{day.forecast}"
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
        puts "Date: #{the_day.date}"
        puts "Wave size: #{the_day.wave_size}"
        puts "Wave description: #{wave_description}"
        puts "Swell Direction: #{the_day.swell_direction}"
        puts "Surfer Dude says: #{the_day.surfer_dude_says}"

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
