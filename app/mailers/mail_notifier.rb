class MailNotifier < ActionMailer::Base

  def new_quote_notifier(quote)
    @quote = quote
    
    mail(:to => "Bora Tunca <bora.tunca@yahoo.com>",
         :from => "new_quote@quotezip.com",
         :subject => "Ahoy, a new quote on quotezip"
    )
  end
end
