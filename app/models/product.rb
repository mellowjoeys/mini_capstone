class Product < ApplicationRecord
  validates :price, numericality: { :greater_than => 0 }
  validates :price, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 500 } # {:in => 10..500} also works
  validates :description, presence: true
  validates :image_url, presence: true

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
