class HomeController < ApplicationController
	
	def index
		@quotes = Quote.all
	end

	def save
		@quote = Quote.new(params['quote'])
		@quote.save
		return redirect_to :action => "index"
	end
end