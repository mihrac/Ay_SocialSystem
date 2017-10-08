class Category < ApplicationRecord
	has_many :images
	has_many :posts
end
