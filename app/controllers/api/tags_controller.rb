class Api::TagsController < ApplicationController
  def index
    render json: Tag.all
  end
  def create
    tag = Tag.new(tag_params)
    tag.users << current_user
    if tag.save!
      render json: tag
    else
      render json: tag.errors
    end
  end
  def show
    render json: Tag.find(params[:id])
  end
  private
  def tag_params
    params.require(:tag).permit!
  end
end
