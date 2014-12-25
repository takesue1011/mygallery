class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @photos = current_user.Photo.order("created_at DESC")
  end

end