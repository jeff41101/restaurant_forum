class Restaurant < ApplicationRecord
  #設定關聯
  belongs_to :category
  has_many :comments
  mount_uploader :image, PhotoUploader
  
  #確認資料有填寫
  validates_presence_of :name, :opening_hours, :tel, :address, :description
end
