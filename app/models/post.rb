class Post < ApplicationRecord
	belongs_to :user
	has_many :images
	belongs_to :category
	has_many :comments, as: :commentable

	mount_uploader :image, ImageUploader


end
