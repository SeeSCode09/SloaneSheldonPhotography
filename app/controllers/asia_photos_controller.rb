class AsiaPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @asia_photos = AsiaPhoto.all
  end

  def show
    @asia_photo = AsiaPhoto.find(params[:id])
  end

  def edit
    @asia_photo = AsiaPhoto.find(params[:id])
  end

  def new
    @asia_photo = AsiaPhoto.new
  end

  def create
    @asia_photo = AsiaPhoto.new(new_asia_photo_params)

    if @asia_photo.save
      flash[:notice] = "Photo added successfully"
      redirect_to asia_photo_path(@asia_photo)
    else
      flash[:notice] = @asia_photo.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
   @asia_photo = AsiaPhoto.find(params[:id])

   if @asia_photo.update(new_asia_photo_params)
     flash[:notice] = "Photo updated!"
     redirect_to asia_photo_path(@asia_photo)
   else
     flash[:notice] = @asia_photo.errors.full_messages.join(', ')
     render :edit
   end
  end

  def destroy
    @asia_photo = AsiaPhoto.find(params[:id])
    if @asia_photo.destroy
      flash[:notice] = "Photo deleted!"
      redirect_to root_path
    else
      flash[:alert] = "Failed to delete photo"
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def new_asia_photo_params
    params.require(:asia_photo).permit(:image, :caption, :country, :description, :date)
  end

  def authorize_user
    if !current_user || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end


end
