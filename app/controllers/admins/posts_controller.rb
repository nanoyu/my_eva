class Admins::PostsController < ApplicationController
	def index
		@posts = Post.paginate(page: params[:page], per_page: 16).search(params[:search])
		@users = User.all
	end

	def show
		@post = Post.find(params[:id])
		@user = @post.user
	end

	def destroy
	end

	private

	def post_params
    params.require(:post).permit(:title, :product_name, :price, :body, :rating, :category_id, :user_id, :label_list)
  	end

end
