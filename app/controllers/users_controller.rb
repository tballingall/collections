#
class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]
  before_action :find_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Signed Up'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Successfully Updated'
      redirect_to user_path
    else
      render 'static_pages/error'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
    redirect_to root_path and return unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password,
                                 :password_confirmation)
  end
end
