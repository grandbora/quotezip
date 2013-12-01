class ReportsController < ApplicationController
  before_filter :signed_in_user

  def create
    quote_id = params[:report][:quote_id]
    quote = Quote.find_by_id(quote_id)

    report = Report.create
    report.quote = quote
    report.user = current_user
    report.save

    redirect_to root_path
  end

  private
  def signed_in_user
    redirect_to user_omniauth_authorize_path(:twitter) unless current_user
  end

end
