class Post < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :category, optional: true

	attachment :product_image
end
