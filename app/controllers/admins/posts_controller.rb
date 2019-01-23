class Admins::PostsController < ApplicationController
	def index
		@posts = Post.all
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
		params.require(:post).permit(:title, :product_name, :price, :body, :category_id, :user_id)
	end

end
