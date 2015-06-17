#
class ImageController < ApplicationController

  def new
    @image = Image.new
  end

  def index
    @images = Image.all.paginate(page: params[:page], per_page: '10')
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = 'Success!'
      redirect_to user_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @image.update_attributes(image_params)
      flash[:success] = 'Successfully Updated'
      redirect_to user_path
    else
      render 'new'
    end
  end

  private

  def find_image
    @image = Image.find(params[:id])
    redirect_to root_path unless @image == current_image
  end

  def image_params
    params.require(:image).permit(:image_uid, :image_name)
      #modified from drafon fly
  end
end
#Can't display images, can't create photo_id
