class HomeController < ApplicationController
  
  def index
    @quotes = Quote.all(:order => "created_at DESC", :limit => 150)
  end

  def save
    @quote = Quote.new(params['quote'])
    @quote.save
    return redirect_to :action => "index"
  end
end