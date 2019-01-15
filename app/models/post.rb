class Post < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :category, optional: true
	has_many :likes
 	has_many :liked_users, through: :likes, source: :user

	attachment :product_image

	def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all #全て表示。
    end
    end
end
