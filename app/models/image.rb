class Image < ApplicationRecord
  belongs_to :product
  # def image
  #   Image.find_by(id: image_id)
  # end
  # def product
  #   Product.find_by(id: product_id)
  # end
end
