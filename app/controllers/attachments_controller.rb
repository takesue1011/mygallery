class AttachmentsController < ApplicationController

  def show
    full_path = "#{Rails.root}" + params[:path]
    image = File.binread(full_path)
    send_data image, :disposition => 'inline'
  end

end