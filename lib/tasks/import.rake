require 'rest_client'
require 'json'

namespace :import do
  desc "Getthe latest quotes from Reamill"
  task :readmill => :environment do

    puts 'ohw ba'

    jsonRes =  RestClient.get 'https://api.readmill.com/v2/highlights?client_id=3f7cce970dd0725710e2519c4006bcac'

    res = JSON.parse(jsonRes)

    res["items"].each { |quote|
     content = quote["highlight"]["content"]

     quote = Quote.new({"content" => content, "book" =>""})
     quote.save
    }
  end
end
