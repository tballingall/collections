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
    @album = album
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      flash[:success] = 'Success!'
      redirect_to album_path(@album)
    else
      render 'new'
    end
  end

  def edit
    @album = album
  end

  def update
    if @album.update_attributes(album_params)
      flash[:success] = 'Successfully Updated'
      redirect_to user_album_path(current_user)
    else
      render 'edit'
    end
  end

  private

  def album
    @album ||= Album.find(params[:id])
  end

  def user
    return album.user unless params[:user_id].present?
    @_album ||= User.find(params[:user_id])
  end

  def album_params
    params.require(:album).permit(:name, :user_id)
  end
end
# Tom's solution: user.albums.build for each Album
# keeping comment to remember question
