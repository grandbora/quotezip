class MailNotifier < ActionMailer::Base

  def new_quote_notifier()

    mail(:to => "Bora Tunga <bora.tunca@yahoo.com>",
         :from => "quotezip@quotezip.com",
         :subject => "quotezip subject"
    )
  end
end
