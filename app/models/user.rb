class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          has_many :messages, dependent: :destroy
          has_many :entries, dependent: :destroy
          belongs_to :tweets

         has_many :recruits, dependent: :destroy
         validates :name, presence: true 
         validates :profile, length: { maximum: 200 }  

          has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
          has_many :followers, through: :reverse_of_relationships, source: :follower
          has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

          has_many :followings, through: :relationships, source: :followed
          def follow(user_id)
            relationships.create(followed_id: user_id)
          end
          def unfollow(user_id)
            relationships.find_by(followed_id: user_id).destroy
          end
          def following?(user)
            followings.include?(user)
          end
          has_many :comments, dependent: :destroy
end
