require 'rest_client'
require 'json'

namespace :import do
  desc "Get the latest quotes from Reamill"
  task :readmill => :environment do

    puts 'readmill import started'

    lastTimestamp = getLastTimestamp
    puts "Last import timestamp : " + lastTimestamp

    requestUrlHash = {
      :host => "api.readmill.com",
      :path => "/v2/highlights",
      :query => {
        "client_id" => ENV["READMILL_APP_ID"],
        "order" => "highlighted_at",
        "from" => lastTimestamp
      }.to_query
    }

    requestUrl = URI::HTTPS.build(requestUrlHash)
    puts "Request url : " + requestUrl.to_s

    jsonRes =  RestClient.get requestUrl.to_s
    res = JSON.parse(jsonRes)
    items = res["items"]
    items.shift
    puts "Number of items to save : " + items.length.to_s

    items.each_with_index { |quote, i|
     content = quote["highlight"]["content"]
     readingId = quote["highlight"]["reading"]["id"]
     book = getBook(readingId)

     quoteRecord = Quote.new({"content" => content, "book" =>book["title"]})
     quoteRecord.save
     puts "Item #{i} saved"

     registerTimestamp(quote["highlight"]["highlighted_at"]) if quote === items.last
    }
  end

  def registerTimestamp(timestamp)
    puts "saving last timestamp : " + timestamp
    stamp = ReadMillImport.new({"last_import" => timestamp})
    stamp.save
  end

  def getLastTimestamp
    ReadMillImport.last!.last_import
  end

  def getBook(readingId)
    requestUrlHash = {
      :host => "api.readmill.com",
      :path => "/v2/readings/" + readingId.to_s,
      :query => {
        "client_id" => ENV["READMILL_APP_ID"]
      }.to_query
    }    

    requestUrl = URI::HTTPS.build(requestUrlHash)
    puts "Reading request url : " + requestUrl.to_s

    jsonRes =  RestClient.get requestUrl.to_s
    res = JSON.parse(jsonRes)
    book = res["reading"]["book"]
  end
end
