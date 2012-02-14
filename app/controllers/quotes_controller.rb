class QuotesController < ApplicationController
	before_filter :find_quote, except: [:index]
	before_filter :find_quotes, only: [:index]

	respond_to :html, :json

	def index
	end

	def new
	end

	def edit
	end

	def show
	end

	def create
		respond_to do |format|
			if @quote.save
				format.html { redirect_to quotes_path, notice: 'Quote submitted' }
				format.json { render json: @quote, status: created, location: @quote }
			else
				format.html { render action: new }
				format.json { render json: @quote.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @quote.update_attributes params[:quote]
				format.html { redirect_to quote_path(@quote), notice: 'Quote updated' }
				format.json { head :ok }
			else
				format.html { render action: edit }
				format.json { render json: @quote.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def find_quotes
		@quotes = Quote.all
	end

	def find_quote
		@quote = Quote.find(params[:id]) if params[:id]
		@quote ||= Quote.new(params[:quote]) if params[:quote]
		@quote ||= Quote.new
	end
end
