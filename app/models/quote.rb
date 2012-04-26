class Quote < ActiveRecord::Base
  class << self
    def recent num = 20
      order("created_at DESC").take(num)
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
  
  has_and_belongs_to_many :tags
  attr_accessible :text, :context, :score, :tag_tokens
  
  def tag_tokens
    if self.tag_ids.length > 0
      self.tag_ids.join(',')
    else
      '[]'
    end
  end
  
  def tag_tokens=(ids)
    self.tag_ids = ids.split(',')
  end
end
