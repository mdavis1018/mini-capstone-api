class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    cartedproduct = CartedProduct.create(
      user_id: params["user_id"],
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: params["status"],
      order_id: params["order_id"],
    )
    cartedproduct.save
    render json: cartedproduct.as_json
  end

  def index
    carted = current_user.carted_products.where(status: "carted")
    render json: carted.as_json
  end
end

def destroy
  carted_product = current_user.carted_products.find_by(id: params["id"], status: "carted")
  carted_product.status = "removed"
  carted_product.save
  render json: { status: "Carted Product successfully removed! :)" }
end

# Make a carted_products create action.
# Assume everything is coming from params. Test it in requests.http.
# Change the user_id to come from current_user.id instead of params. Test it in requests.http
# Change the order_id to be nil instead of params. Test it in requests.http
# Change the status to always be "carted" instead of params. Test it in requests.http
