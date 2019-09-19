class Order < ApplicationRecord
  has_many :product, through: :carted_products
  belongs_to :user
end
