require_relative "../spec_helper"
require Rails.root.join('db','seeds') 

describe "Quote scopes" do
  it "Has the bottom scores in the right order" do
    Quote.bottom(5).should == Quote.order(:score).take(5)
    Quote.bottom(5).should == (Quote.all.sort_by &:score).first(5)
  end
  
  it "Has the lowest scores on the bottom" do
    Quote.bottom(1).first.score.should == Quote.minimum(:score)
  end
  
  it "Has the top scores in the right order" do
    Quote.top(5).should == Quote.order("score DESC").take(5)
    Quote.top(5).should == (Quote.all.sort_by &:score).reverse.first(5)
  end
  
  it "Has the highest scores on top" do
    Quote.top(1).first.score.should == Quote.maximum(:score)
  end
  
  it "Has the most recent in order" do
    Quote.recent(5).should == Quote.order(:created_at).take(5)
    Quote.recent(5).should == (Quote.all.sort_by &:created_at).first(5)
  end
  
  it "Has the most recent quote first" do
    Quote.recent(5).first.created_at.time.to_s.should == Quote.maximum(:created_at).to_s
  end
  
  # Not active - this could randomly fail due to the joy of randomness
  #
  # it "Should be somewhat random" do
  #   Quote.random(5).map(&:id).should_not == Quote.random(5).map(&:id)
  # end
end