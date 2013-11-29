class FeedController < ApplicationController
  def index
    @quotes = Quote.feed
  end
end
