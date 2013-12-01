class VotesController < ApplicationController
  # before_filter :authenticate_user!
  before_filter :signed_in_user

  def create
    quote_id = params[:vote][:quote_id]
    quote = Quote.find_by_id(quote_id)

    vote = Vote.create
    vote.quote = quote
    vote.user = current_user
    vote.save

    redirect_to root_path
  end

 def signed_in_user
    redirect_to user_omniauth_authorize_path(:twitter) unless current_user
  end

end
