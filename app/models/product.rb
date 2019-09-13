class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  validates :price, numericality: { :greater_than => 0 }
  validates :price, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 500 } # {:in => 10..500} also works
  validates :description, presence: true
  validates :image_url, presence: true

  # def supplier # belongs_to :supplier replaces this code
  #   Supplier.find_by(id: self.supplier_id)
  # end

  # def images # has_many :images replaces this code
  #   Image.where(product_id: self.id)
  # end

  def is_discounted?
    # true if price < 300 
    # else false
    # price < 300 ? true : false # this line utilizes the ternary operator, leading to the happy or sad paths. 
    price < 300
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end