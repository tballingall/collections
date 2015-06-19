#
class AlbumController < ApplicationController
  before_action :require_login, unless: :logged_in?
  def new
    @album = Album.new
  end

  def index
    @albums = Album.all.paginate(page: params[:page], per_page: '10')
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = current_user.albums.build(album_id: album_params)
    if @album.save
      flash[:success] = 'Success!'
      redirect_to user_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @album.update_attributes(album_params)
      flash[:success] = 'Successfully Updated'
      redirect_to user_path
    else
      render 'new'
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :username, :image)
  end
end
