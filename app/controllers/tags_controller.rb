class TagsController < ApplicationController
  before_filter :find_tags, only: [:index]
  
  def index
  end
  
  protected
  def find_tags
    @tags = Tag.all
  end
end