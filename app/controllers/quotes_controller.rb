class QuotesController < ApplicationController
	before_filter :find_quote

	respond_to :html, :json

	def new
	end

	def create
		@quote.save
		respond_with @quote
	end

	private
	def find_quote
		@quote = Quote.find(params[:id]) if params[:id]
		@quote ||= Quote.new(params[:quote]) if params[:quote]
		@quote ||= Quote.new
	end
end
