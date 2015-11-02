class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.where(user_id: current_user.id)
  end

  def new
    @outfit = Outfit.new
  end

  def create
    raise
    @outfit = Outfit.new
    @outfit.name = params[:outfit][:name]
    @outfit.temp = params[:outfit][:temp]
    @outfit.rain = params[:outfit][:rain]
    @outfit.user_id = params[:outfit][:user_id]
    @outfit.image_upload = params[:image_upload]
    if @outfit.save
      redirect_to @outfit
    else
      flash.now.alert = "There was a problem uploading your outfit. Please try again."
      render 'new'
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  private

  def outfit_params
       params.require(:outfit).permit(:name, :temp, :rain, :user_id, :image_upload)
  end
end
