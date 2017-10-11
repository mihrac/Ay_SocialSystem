class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    mount_uploader :avatar, AvatarUploader
    validates :username, uniqueness: true, presence: true       

         has_many :posts, dependent: :destroy
         has_many :images, dependent: :destroy
         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

         has_many :active_blockingships, class_name: "Blockingship", foreign_key: "blocker_id", dependent: :destroy
         has_many :passive_blockingships, class_name: "Blockingships", foreign_key: "blocked_id", dependent: :destroy

         has_many :following, through: :active_relationships, source: :followed
         has_many :followers, through: :passive_relationships, source: :follower

         has_many :blocking, through: :active_blockingships, source: :blocked
         has_many :blockers, through: :passive_blockingships, source: :blocker



#follow methodları

         
         def follow(other)
         	active_relationships.create(followed_id: other.id)
         end

         def unfollow(other)
         	active_relationships.find_by(followed_id: other.id).destroy
         end

         def following?(other)
         	following.include?(other)
         end

#Block methodları
         def block(other)
         	active_blockingships.create(blocked_id: other.id)
         end

         def unblock(other)
         	active_blockingships.find_by(blocked_id: other.id).destroy
         end

         def blocking?(other)
         	blocking.include?(other)
         end



end
