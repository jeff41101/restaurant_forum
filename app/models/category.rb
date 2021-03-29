class Category < ApplicationRecord
  validates_presence_of :name
  
  # build relationship
  has_many :restaurants
end
