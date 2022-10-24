class Product < ApplicationRecord
  validates :name, uniqueness: true
  validates :price, presence: true
  #validates :price, only_integer: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  belongs_to :supplier
  has_many :images
  # has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :orders, through: :carted_products

  def is_discounted
    if price < 10
      true
    else
      false
    end
  end

  def tax
    tax_total = price * 0.09
    tax_total
  end

  def total
    price + tax
  end

  # def categories
  # category_products.map do |category_products|
  #   category_products.category
  # end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end
end

# Price - presence - numericality and not a negative number or 0
# Description - length of a minimum of 10 and a maximum of 500 characters
