class NorthAmericaPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @north_america_photos = NorthAmericaPhoto.all
  end

  def show
    @north_america_photo = NorthAmericaPhoto.find(params[:id])
  end

  def edit
    @north_america_photo = NorthAmericaPhoto.find(params[:id])
  end

  def new
    @north_america_photo = NorthAmericaPhoto.new
  end

  def create
    @north_america_photo = NorthAmericaPhoto.new(new_north_america_photo_params)

    if @north_america_photo.save
      flash[:notice] = "Photo added successfully"
      redirect_to north_america_photo_path(@north_america_photo)
    else
      flash[:notice] = @north_america_photo.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
   @north_america_photo = NorthAmericaPhoto.find(params[:id])

   if @north_america_photo.update(new_north_america_photo_params)
     flash[:notice] = "Photo updated!"
     redirect_to north_america_photo_path(@north_america_photo)
   else
     flash[:notice] = @north_america_photo.errors.full_messages.join(', ')
     render :edit
   end
  end

  def destroy
    @north_america_photo = NorthAmericaPhoto.find(params[:id])
    if @north_america_photo.destroy
      flash[:notice] = "Photo deleted!"
      redirect_to root_path
    else
      flash[:alert] = "Failed to delete photo"
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def new_north_america_photo_params
    params.require(:north_america_photo).permit(:image, :caption, :country, :description, :date, :order)
  end

  def authorize_user
    if !current_user || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end


end
