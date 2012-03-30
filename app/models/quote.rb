class Quote < ActiveRecord::Base
  class << self
    def recent num = 20
      order(:created_at).take(num)
    end
  end
end
