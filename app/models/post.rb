class Post < ApplicationRecord
	belongs_to :user
	has_many :images
	belongs_to :category

	mount_uploader :image, ImageUploader


end
