class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @photos = Photo.order('created_at DESC')
  end

end