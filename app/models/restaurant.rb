class Restaurant < ApplicationRecord
  #設定關聯
  belongs_to :category

  # 如果刪除Restaurant也會一併刪除Comment
  has_many :comments, dependent: :destroy
  mount_uploader :image, PhotoUploader
  
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  #確認資料有填寫
  validates_presence_of :name, :opening_hours, :tel, :address, :description

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

  def is_liked?(user)
    self.liked_users.include?(user)
  end  
end
