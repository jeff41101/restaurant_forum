class Category < ApplicationRecord
  # build relationship
  has_many :restaurants
end
