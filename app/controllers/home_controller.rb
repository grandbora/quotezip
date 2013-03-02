class HomeController < ApplicationController

  respond_to :html, :json
  
  def index
    @quotes = Quote.all(:order => "created_at DESC", :limit => 150)
  end

  def save
    @quote = Quote.new(params['quote'])
    @quote.save
    return redirect_to :action => "index"
  end

  def get_by_book
    respond_with(Quote.where("book = :book", {:book => params['q']}))
  end

  def get_by_content
    respond_with(Quote.where("content LIKE :q", {:q => "%#{params['q']}%"}))
  end

end