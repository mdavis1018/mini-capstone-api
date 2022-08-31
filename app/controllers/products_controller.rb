class ProductsController < ApplicationController
  def index
    index = Product.all
    render json: index.as_json
  end

  def show
    show = Product.find_by(id: params["id"])
    render json: show.as_json
  end

  def  
    # fill in for creating new product
  end
end
