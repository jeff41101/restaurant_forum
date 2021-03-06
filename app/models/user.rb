class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
  mount_uploader :avatar, AvatarUploader


  # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :comments, dependent: :restrict_with_error

  has_many :restaurants, through: :comments

  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :inverser_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverser_followships, source: :user

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  # source -> the key that needs to be returned (friend-> friend_id)
  has_many :inverser_friendships, class_name: "Friendship", foreign_key: "friend_id" 
  has_many :frienders, through: :inverser_friendships, source: :friend

  def admin?
    self.role == "admin"
  end

  #check the following status
  def following?(user)
    self.followings.include?(user)
  end

  def friend?(user)
    self.friends.include?(user)
  end
  
end
