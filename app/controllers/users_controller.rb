class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.paginate(page: params[:page], per_page: 16).search(params[:search])
  end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
    end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

      def edit
        @user = User.find(params[:id])
      end

      def profile_edit
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
      @posts = @user.posts.paginate(page: params[:page], per_page: 16)
    end

    def user_likes
      @user = User.find(params[:id])
      @posts = @user.posts.paginate(page: params[:page], per_page: 16)
    end

    def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end


    private

    def user_params
      params.require(:user).permit(:name, :introduce, :email, :phone_number, :profile_image_id, :iprofile_image_id_cache, :remove_profile_image_id)
    end

  end
