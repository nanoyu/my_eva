class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
  	@post = Post.new
  end

  def index
  	#ViewのFormで取得したパラメータをモデルに渡す
    @posts = Post.paginate(page: params[:page], per_page: 5).search(params[:search])
    @categories = Category.all
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @like = Like.new
    @user = @comment.user
  end

  def post_comments
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @user = @comment.user
  end

  def like_users
    @post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
     flash[:notice] = "Post was successfully created"
     redirect_to post_path(post.id)
   else
    flash[:error] = post.errors.full_messages
    redirect_to new_post_path
    end
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

def tag_search
  if params[:tag_name]
    @posts = Post.tagged_with(params[:tag_name]).paginate(page: params[:page], per_page: 16)
  else
    @posts = Post.paginate(page: params[:page], per_page: 16)

  end
    # @posts = Post.where(label_list: params[:tag_name])
  end

  private

  def post_params
    params.require(:post).permit(:title, :product_name, :price, :body, :rating, :category_id, :user_id, :label_list)
  end

end
