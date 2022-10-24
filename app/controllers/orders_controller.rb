class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end

  def show
    @order = Order.find_by(id: params["id"])
    if current_user.id == @order.user_id
      # if current_user
      #   orders = current_user.order
      # @product = Product.find_by(id: params["id"])
      render template: "orders/show"
    end
  end

  def create
    if current_user
      # product = Product.find_by(id: params["product_id"])
      # calculated_subtotal = product.price * params["quantity"].to_i
      # calculated_tax = product.tax * params["quantity"].to_i
      # calculated_total = calculated_subtotal + calculated_tax
      carted_products = current_user.carted_products.where(status: "carted")

      calculated_subtotal = 0
      calculated_tax = 0
      calculated_total = 0

      carted_products.each do |carted_product|
        product = carted_product.product
        calculated_subtotal += product.price * carted_product.quantity
        calculated_tax += product.tax * carted_product.quantity
        calculated_total += calculated_subtotal + calculated_tax
      end
      @order = Order.new(
        user_id: current_user.id,
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      )
      if @order.save
        carted_products.update_all(status: "purchased", order_id: @order.id)
      end
      render template: "orders/show"
      # else
      #   render json: { message: "Not authorized to view" }, status: :unauthorized
      # if order.save
      #   render json: { message: "Order created successfully" }, status: :created
      # else
      #   render json: { errors: order.errors.full_messages }, status: :bad_request
      # end
    end
  end
end

# def create
#   order = Order.new(
#     user_id: params["user_id"],
#     product_id: params["product_id"],
#     quantity: params["quantity"],
#     subtotal: params["subtotal"],
#     tax: params["tax"],
#     total: params["total"],
#   )
#   if order.save
#     render json: { message: "Order created successfully" }, status: :created
#   else
#     render json: { errors: order.errors.full_messages }, status: :bad_request
#   end
# end
