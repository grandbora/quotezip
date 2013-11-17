class FeedController < ApplicationController
  def index
    @quotes = Quote.all(:order => "updated_at DESC", :limit => 150)
  end
end
