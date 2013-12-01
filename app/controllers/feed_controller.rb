class FeedController < ApplicationController
  def index
    @quotes = Quote.feed
  end

  def uncached
    ActiveRecord::Base.connection.clear_query_cache
    @quotes = Quote.feed
    render "index"
  end
end
