class QuotesController < ApplicationController
	before_filter :find_quote

	def new
		
	end

	private
	def find_quote
		@quote = Quote.find(params[:id]) if params[:id]
		@quote ||= Quote.new
	end
end