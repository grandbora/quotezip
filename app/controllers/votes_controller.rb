class VotesController < ApplicationController
  def create
    quote_id = params[:vote][:quote_id]
    quote = Quote.find_by_id(quote_id)

    vote = Vote.create
    vote.quote = quote
    vote.user = current_user
    vote.save

    redirect_to root_path
  end
end
