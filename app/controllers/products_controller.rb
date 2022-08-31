class ProductsController < ApplicationController
  def all_products
    product = Product.all
    render json: product.as_json
  end

  def one_product
    one_product = Product.find_by(id: params["id"])
    render json: one_product.as_json
  end
end
