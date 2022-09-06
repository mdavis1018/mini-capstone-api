class Product < ApplicationRecord
  validates :name, uniqueness: true
  validates :price, presence: true
  #validates :price, only_integer: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

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
end

# Price - presence - numericality and not a negative number or 0
# Description - length of a minimum of 10 and a maximum of 500 characters

