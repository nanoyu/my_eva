class Post < ApplicationRecord

	belongs_to :user

	attachment :product_image
end
