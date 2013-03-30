class MailNotifier < ActionMailer::Base

  def new_quote_notifier(quote)
    @quote = quote
    
    mail(:to => "Bora Tunca <bora.tunca@yahoo.com>",
         :from => "new_quote@quotezip.com",
         :subject => "Ahoy, a new quote on quotezip"
    )
  end

  def new_subscription_notifier(user)
    mail(:to => "Bora Tunca <bora.tunca@yahoo.com>",
         :from => "new_subscription@quotezip.com",
         :subject => "Ahoy, a new subscription on quotezip"
    ) do |format|
      format.html { render :text => user.email }
    end
  end

end
