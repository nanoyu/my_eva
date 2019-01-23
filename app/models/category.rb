class Category < ApplicationRecord

	has_many :posts, dependent: :destroy, inverse_of: :category
    accepts_nested_attributes_for :posts, allow_destroy: true

end
