class HomeController < ApplicationController

  respond_to :html, :json
  
  def index
    @quotes = Quote.all(:order => "updated_at DESC", :limit => 150)
  end

  def show
    @quotes = Quote.where("id = :id", {:id => params['id']})
  end

  def save
    quote = Quote.new(params['quote'])
    quote.save
    MailNotifier.new_quote_notifier(quote).deliver

    redirect_to :action => "index"
  end

  def get_by_book
    respond_with(Quote.where("book = :book", {:book => params['q']}))
  end

  def get_by_content
    respond_with(Quote.where("content LIKE :q", {:q => "%#{params['q']}%"}))
  end

  def get_all
    respond_with(Quote.all(:order => "updated_at DESC", :limit => 150))
  end

  def subscribe
    user = User.new
    user.email= params['email']
    user.save
    MailNotifier.new_subscription_notifier(user).deliver

    redirect_to :action => "index"
  end

end
