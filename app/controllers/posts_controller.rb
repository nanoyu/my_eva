class PostsController < ApplicationController

before_action :authenticate_user!

  def new
  	@post = Post.new
  end

  def index
  	#ViewのFormで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
    @categories = Category.all
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @like = Like.new
    @user = @comment.user
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def create
  	 post = Post.new(post_params)
  	 post.user_id = current_user.id
     post.save!
     redirect_to post_path(post.id)
  end

  def update
  	post = Post.find(params[:id])
        post.update(post_params)
        redirect_to post_path(post.id)
  end

  def destroy
  	post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path
  end


  private

    def post_params
        params.require(:post).permit(:title, :product_name, :price, :body, :category_id, :user_id)
    end


end