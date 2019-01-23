class Admins::UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :profile_image_id, :image_cache, :remove_image)
  end

end
