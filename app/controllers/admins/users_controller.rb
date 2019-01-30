class Admins::UsersController < ApplicationController
  def index
  	@users = User.paginate(page: params[:page], per_page: 16).search(params[:search])
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params
      params.require(:user).permit(:name, :introduce, :email, :phone_number, :profile_image_id, :iprofile_image_id_cache, :remove_profile_image_id)
  end

end
