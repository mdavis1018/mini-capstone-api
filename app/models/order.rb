class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :product
  has_many :carted_products
  has_many :products, through: :carted_products
end

# Allow users to "purchase" items in your mini-capstone
# 1) Create an orders controller.
# 2) Add an orders create action. Assume you're getting ALL params from the user (user_id, product_id, quantity, subtotal, tax, total). I know this is wrong, but do it this way first.
# 3) Test the orders create in requests.http.
# this is where you stopped
# 4) Add an orders show action. Assume it's completely normal!
# 5) Test the orders show in requests.http.
# 6) Add an orders index action. Assume it's completely normal!
# 7) Test the orders index in requests.http.
# 8) Change the orders create so the user_id comes from current_user.id.
# 9) Change the orders create so the subtotal, tax, and total come from calculations. do
# 10) Change the orders show so only the current user can see their order.
# 11) Change the orders index so only the current user can see their orders.
