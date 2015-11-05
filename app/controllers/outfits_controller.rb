class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.where(user_id: current_user.id)
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.create(outfit_params)
    @outfit.image_upload = params[:outfit][:image_upload]
    if @outfit.save
      redirect_to @outfit
    else
      render 'new'
    end
  end

  def edit
    @outfit = Outfit.find(params[:id])
  end

  def update
    if @outfit.update(outfit_params)
      flash.alert = "Outfit successfully updated."
      redirect_to @outfit
    else
      flash.now.alert = "Please try again"
      render 'edit'
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path 
  end

  private

  def outfit_params
       params.require(:outfit).permit(:name, :temp, :rain, :user_id, :gender, :image_upload)
  end
end
