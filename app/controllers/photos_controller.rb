class PhotosController < ApplicationController

  def index
    @photos = Photo.all.order("created_at DESC")
  end
  def new
  end

  def create
    Photo.create(create_params)
  end

  private
  def create_params
    params.permit(:title, :photographer, :caption, :image)
  end

end