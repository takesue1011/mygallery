class PhotosController < ApplicationController

  before_action :set_something, only: [:new]  # 除外するアクションを定義する

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

  def set_something
    unless user_signed_in?
    redirect_to '/'
    end
  end

end