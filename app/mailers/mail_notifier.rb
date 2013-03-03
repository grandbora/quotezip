class MailNotifier < ActionMailer::Base

  def new_quote_notifier()

    mail(:to => "Bora Tunga <bora.tunca@yahoo.com>",
         :from => "quotezip admin from field ",
         :subject => "quotezip subject",
         :body => { :user => 'user', :url => 'url' }
    )



    # recipients "Bora Tunga <bora.tunca@yahoo.com>"
    # from       "quotezip admin from field "
    # subject    "quotezip subject"
    # sent_on    Time.now
    # body       ({ :user => 'user', :url => 'url' })
  end

end


# class InvitationMailer < ActionMailer::Base
#   default from: "webmaster@myapp.com"

#   def hassle_email(user)
#     @user = user
#     mail(:to => user.email,
#          :subject => "You have been Invited!")
#   end
# end