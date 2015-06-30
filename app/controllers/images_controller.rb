#
class ImageController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :ensure_current_user. except [:show, :index]
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
    @image = album.images.new(image_params)
    if @image.save
      flash[:success] = 'Success!'
      redirect_to album_path(album)
    else
      render 'new'
    end
  end

  def cover
    album.update_attributes(cover: picture)
    redirect_to album_path(album), notice: I18n.t('album.picture.success')
  end

  private

  def image
    @_image ||= Image.find(params[:id])

  def find_image
    @image = Image.find(params[:image_uid])
    redirect_to root_path unless @image == current_image
  end

  def image_params
    params.require(:image).permit(:name, :description, :year, :image)
  end
end
