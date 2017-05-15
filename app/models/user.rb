class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tags

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy

  has_many :posts, dependent: :destroy
  has_many :active_likes, class_name: "Like",
                          foreign_key: "user_id",
                          dependent: :destroy
  has_many :likes, :foreign_key => "user_id", :dependent => :destroy
  has_many :liking, through: :active_likes, source: :post
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def like(post)
    liking << post
  end

  def unlike(post)
    liking.delete(post)
  end

  def liking?(post)
    liking.include?(post)
  end
end
