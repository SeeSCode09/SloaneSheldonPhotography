class NorthAmericaPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @north_america_photos = NorthAmericaPhoto.all
  end

  def show
    @north_america_photo = NorthAmericaPhoto.find(params[:id])
  end

end
