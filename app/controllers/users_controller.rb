class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
  end

  def user_posts
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :profile_image_id, :iprofile_image_id_cache, :remove_profile_image_id)
  end

end
