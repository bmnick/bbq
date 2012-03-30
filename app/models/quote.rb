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
  end
end
