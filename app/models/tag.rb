class Tag < ActiveRecord::Base
  has_and_belongs_to_many :quotes
  
  def num_quotes
    return quotes.length
  end
end
