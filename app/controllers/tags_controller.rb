class TagsController < ApplicationController
  before_filter :find_tags, only: [:index]
  
  def index
    respond_to do |format|
      format.html 
      format.json { render json: @tags }
    end
  end
  
  protected
  def find_tags
    @tags = Tag.where("name like ?", "%#{params[:q]}%")
    @tags ||= Tag.all
  end
end