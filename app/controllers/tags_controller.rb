class TagsController < ApplicationController
  before_filter :find_tags, only: [:index]
  before_filter :find_tag, except: [:index]
  
  helper :tag_cloud
  
  def index
    respond_to do |format|
      format.html 
      format.json { render json: @tags }
    end
  end
  
  def new
  end
  
  def create
    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_path, notice: 'Quote submitted' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  
  protected
  def find_tags
    @tags = Tag.where("name like ?", "%#{params[:q]}%")
    @tags ||= Tag.all
  end
  
  def find_tag
    @tag = Tag.find(params[:id]) if params[:id]
    @tag ||= Tag.new(params[:tag]) if params[:tag]
    @tag ||= Tag.new
  end
end