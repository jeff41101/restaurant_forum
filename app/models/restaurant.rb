class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name, :opening_hours, :tel, :address, :description, :image
end
