class ProductsController < ApplicationController
  def index
    index = Product.all
    render json: index.as_json
  end

  def show
    show = Product.find_by(id: params["id"])
    render json: show.as_json
  end

  def create
    product = Product.new(
      name: "Nike ",
      price: 120,
      image_url: "https://www.ugg.com/master-sale/westsider-neumel-weather/1120902.html?dwvar_1120902_color=TSD",
      description: "A great shoe for running",
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    product.save
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params["id"])

    product.name = params["name"]
    product.price = params["price"]
    product.image_url = params["image_url"]
    product.description = params["description"]

    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params["id"])

    product.destroy

    render json: { message: "destroyed!" }
  end
end
