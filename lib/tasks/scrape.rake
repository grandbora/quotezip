require 'nokogiri'
require 'open-uri'

namespace :scrape do
  desc "Scrape goodreads popular quotes, add them to database"
  task :goodreads => :environment do

    for page in 1..101

      doc = Nokogiri::HTML(open('http://www.goodreads.com/quotes?page=' + page.to_s))

      puts 'PAGE ::::::::' + page.to_s

      doc.css('div.quotes div.quote div.quoteText').each do |quoteDiv|

        elements = quoteDiv.children
      
        unless elements.at_css 'i a'
          next
        end

        content = ''
        lastBreak = elements.filter('br').last
        elements.each do |element|

            if element.instance_of? Nokogiri::XML::Text
              content += element.text.gsub(/[(\u201C)(\u201D)(\n)]/, '').strip
              next
            end

            if element === lastBreak
              break
            end

          end 
        puts content.inspect


        author = elements.css('a').children[0].text
        puts author.inspect

        book = elements.css('i a').children[0].text
        puts book.inspect

        puts '::::::::: Creating entity :::::::::::'
        Quote.create( :content => content, :book => book )

      end
    end
  end
end