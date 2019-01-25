class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
		@posts = @category.posts.paginate(page: params[:page], per_page: 16).search(params[:search])
		@categories = Category.all
	end

	private

	def category_params
		params.require(:category).permit(:category_name,
			posts_attributes: [:id, :title, :product_name, :price, :body, :category_id, :user_id])
	end

end
