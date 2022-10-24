class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    if params["category"]
      # p params["category"]
      category = Category.find_by(name: params["category"])
      @products = category.products
    end
    render template: "products/index"
    # localhost:3000/products.json?category=Weapons
  end

  def show
    @product = Product.find_by(id: params["id"])
    # render json: product.as_json(methods: [:is_discounted, :tax, :total])
    render template: "products/show"
  end

  def create
    if current_user && current_user.admin
      @product = Product.new(
        supplier_id: params["supplier_id"],
        inventory_num: params["inventory_num"],
        name: params["name"],
        price: params["price"],
        description: params["description"],
      )
      # product.save
      # render json: product.as_json

      if @product.save
        render json: @product.as_json(methods: [:is_discounted, :tax, :total])
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: [], status: :unauthorized
    end
  end

  def update
    @product = Product.find_by(id: params["id"])

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description

    if @product.save
      render json: @product.as_json(methods: [:is_discounted, :tax, :total])
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])

    product.destroy

    render json: { message: "destroyed!" }
  end
end

# Exercise: Decomposition
# Write out all the steps necessary for your mini-capstone-api to allow users to purchase multiple products with a shopping cart. (aim for roughly 10 to 15 steps)
# Do not write any code for this exercise; just focus on decomposing the different steps necessary to complete the feature.

# 1. Create a carted_product model
#2. Create an orders model
#3. remove product_id from orders table (schema)
#4. write out the appropriate associations for create_product in its model file (belongs_to :product, order, user)
#5. write out the appropriate associations for orders in its model file (belongs_to :user)
# 6. Do something with the orders controller and views probably
# 7. create a carted_product controller so that the user can view his cart and what products are in it on the web. Also so you can add a product to the carted_product (create action).
#8.
