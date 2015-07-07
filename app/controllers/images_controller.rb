#
class ImagesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :ensure_current_user, except: [:show, :index]
  def new
    @image = album.images.new
  end

  def index
    @images = Image.all.paginate(page: params[:page], per_page: '10')
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = album.images.new(image_params)
    if @image.save
      flash[:success] = 'Success!'
      redirect_to album_path(album)
    else
      render 'new'
    end
  end

  def cover
    album.update_attributes(cover: image)
    redirect_to album_path(album)
  end

  private

  def album
    return image.album unless params[:album_id].present?
    @album ||= Album.find(params[:album_id])
  end

  def image
    @_image ||= Image.find(params[:id])
  end

  def user
    album.user
  end

  def image_params
    params.require(:image).permit(:name, :description, :year, :image)
  end
end
