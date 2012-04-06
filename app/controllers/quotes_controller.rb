class QuotesController < ApplicationController
	before_filter :find_quote, except: [:index]
	before_filter :find_quotes, only: [:index]

	respond_to :html, :json

	def index
	end
	
	def recent
		@quotes = Quote.recent
	end
	
	def top
		@quotes = Quote.top
	end
	
	def bottom
		@quotes = Quote.bottom
	end
	
	def random
		@quotes = Quote.random
	end
	
	def search
		@search_string = params[:quote][:text]
		@quotes = Quote.search(@search_string)
	end

	def new
	end

	def edit
	end

	def show
	end

	def destroy
		@quote.destroy

		respond_to do |format|
			format.html { redirect_to quotes_path, notice: 'Quote deleted' }
			format.json { head :ok }
		end
	end

	def create
		respond_to do |format|
			if @quote.save
				format.html { redirect_to quotes_path, notice: 'Quote submitted' }
				format.json { render json: @quote, status: :created, location: @quote }
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

	def upvote
		@quote.score += 1

		respond_to do |format|
			if @quote.save
				format.html { redirect_to quote_path(@quote)}
				format.json { head :ok }
			else
				format.html { redirect_to quote_path(@quote), notice: 'Failed to upvote this quote'}
				format.json { render json: @quote.errors, status: :unprocessable_entity }
			end
		end
	end

	def downvote
		@quote.score -= 1

		respond_to do |format|
			if @quote.save
				format.html { redirect_to quote_path(@quote)}
				format.json { head :ok }
			else
				format.html { redirect_to quote_path(@quote), notice: 'Failed to downvote this quote'}
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
