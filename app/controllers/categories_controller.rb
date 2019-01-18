class CategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:id])
  	@posts = @category.posts.page(params[:page]).per(9).reverse_order
  	@categories = Category.all
  end


private


  def category_params
          params.require(:category).permit(:category_name,
           posts_attributes: [:id, :title, :product_name, :price, :body, :category_id, :user_id])
      end
end
