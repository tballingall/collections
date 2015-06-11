class ClosetsController < ApplicationController

  def new
    @closets = Closet.new
  end

  def index
    @closets = closet.all.paginate(page: params[:page], per_page: '9')
  end

  def show
    @closet = closet.find(:id) #user_id
    # @photo = @closet.photos.new
  end

  def create
    @closet = closet.new(closet_params)
    if @closet.save
      session[:closet_id] = @closet.id
      flash[:success] = 'Closet Created'
      redirect_to @closet
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @closet.update_attributes(closet_params)
      flash[:success] = 'Successfully Updated'
      redirect_to user_path
    else
      render 'new'
    end
  end
   private

#   def find_closet
#     @closet = closet.find(params[:id])
#     redirect_to root_path unless @closet == current_closet
#   end

   def closet_params
     params.require(:closet).permit(:name, :id)
   end
# end
end
