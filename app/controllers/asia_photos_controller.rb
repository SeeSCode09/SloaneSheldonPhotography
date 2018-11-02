class AsiaPhotosController < ApplicationController

  def index
    @asia_photos = AsiaPhoto.all
  end

  def show
    @asia_photo = AsiaPhoto.find(params[:id])
  end

end
