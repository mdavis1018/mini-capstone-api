class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    # render json: product.as_json(methods: [:is_discounted, :tax, :total])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: "Nike ",
      price: 120,
      image_url: "https://www.ugg.com/master-sale/westsider-neumel-weather/1120902.html?dwvar_1120902_color=TSD",
      description: "A great shoe for running",
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    # product.save
    # render json: product.as_json

    if @product.save
      render json: @product.as_json(methods: [:is_discounted, :tax, :total])
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params["id"])

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
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

# In your mini-capstone, add validations and sad paths for your create and update actions!
# ● Add validations to your Rails models
# ● Add an if / else condition to your controller create action to deal with happy / sad paths
# ● Add an if / else condition to your controller update action to deal with happy / sad paths
