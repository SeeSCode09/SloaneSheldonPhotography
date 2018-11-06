class AfricaPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @africa_photos = AfricaPhoto.all
  end

  def show
    @africa_photo = AfricaPhoto.find(params[:id])
  end

  def edit
    @africa_photo = AfricaPhoto.find(params[:id])
  end

  def new
    @africa_photo = AfricaPhoto.new
  end

  def create
    @africa_photo = AfricaPhoto.new(new_africa_photo_params)

    if @africa_photo.save
      flash[:notice] = "Photo added successfully"
      redirect_to africa_photo_path(@africa_photo)
    else
      flash[:notice] = @africa_photo.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
   @africa_photo = AfricaPhoto.find(params[:id])

   if @africa_photo.update(new_africa_photo_params)
     flash[:notice] = "Photo updated!"
     redirect_to africa_photo_path(@africa_photo)
   else
     flash[:notice] = @africa_photo.errors.full_messages.join(', ')
     render :edit
   end
  end

  def destroy
    @africa_photo = AfricaPhoto.find(params[:id])
    if @africa_photo.destroy
      flash[:notice] = "Photo deleted!"
      redirect_to root_path
    else
      flash[:alert] = "Failed to delete photo"
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def new_africa_photo_params
    params.require(:africa_photo).permit(:image, :caption, :country, :description, :date, :order)
  end

  def authorize_user
    if !current_user || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end


end
