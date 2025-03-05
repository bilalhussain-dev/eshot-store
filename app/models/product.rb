class Product < ActiveRecord::Base
  validates :title, :description, :price, :stock, presence: true
end