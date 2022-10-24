class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :orders
  has_many :category_products
  has_many :carted_products
  
end

# Exercise: Decomposition
# Write out all the steps necessary for your mini-capstone backend to allow users to purchase products. (aim for roughly 5 to 10 steps)
# For now, a user can submit an order for any quantity of a single product (we are not implementing a “shopping cart” where an order contains multiple products).
# Do not write any code for this exercise; just focus on decomposing the different steps necessary to complete the feature.

# 1. Create an orders.controller that allows a user to create a new order
# 2. we would have to authenticate that a user has logged in
