class AfricaPhotosController < ApplicationController

  def index
    @africa_photos = AfricaPhoto.all
  end

  def show
    @africa_photo = AfricaPhoto.find(params[:id])
  end

end
