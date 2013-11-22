class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    userHash = request.env["omniauth.auth"]
    @user = User.find_or_create_via_twitter(userHash)

    unless @user.persisted?
      session["devise.twitter_data"] = userHash
      @user.save
    end

    sign_in_and_redirect @user, :event => :authentication
  end
end
