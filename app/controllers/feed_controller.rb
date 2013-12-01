class FeedController < ApplicationController
  def index
    @quotes = Quote.feed
  end

  def show
    quoteRelation = Quote.where("id = :id", {:id => params['id']})
    render :status => 404 if quoteRelation.empty?

    @quote = quoteRelation.first
  end

end
