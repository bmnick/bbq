class Quote < ActiveRecord::Base
  class << self
    def recent num = 20
      order(:created_at).take(num)
    end
    
    def top num = 20
      order("score DESC").take(num)
    end
    
    def bottom num=20
      order(:score).take(num)
    end
    
    def random num=20
      order("random()").take(num)
    end
    
    def search query
      if query
        Quote.where "text like ?", "%#{query}%"
      else
        Quote.all
      end
    end
  end
end
