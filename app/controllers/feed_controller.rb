class FeedController < ApplicationController
  def index
    @quotes = Quote.feed
  end

  def uncached
    ActiveRecord::Base.connection.clear_query_cache
    @quotes = Quote.feed
    render "index"
  end

  def show
    quoteRelation = Quote.where("id = :id", {:id => params['id']})
    render :status => 404 if quoteRelation.empty?

    @quote = quoteRelation.first
  end

end
