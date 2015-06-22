#
class AlbumsController < ApplicationController
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
    @album = Album.new(album_params)
    @album.user_id = current_user_id if current_user?
    if @album.save
      flash[:success] = 'Success!'
      redirect_to user_albums_path
    else
      render 'new'
    end
  end

  def edit
    @album = Album.current_user
  end

  def update
    if @album.update_attributes(album_params)
      flash[:success] = 'Successfully Updated'
      redirect_to user_album_path
    else
      render 'edit'
    end
  end

  private

  def album_params
    params.require(:album).permit(:album_name, :username, :image, :album_uid,
                  :user_id)
  end
end
