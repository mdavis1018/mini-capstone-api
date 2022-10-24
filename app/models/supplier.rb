class Supplier < ApplicationRecord
  validates :name, uniqueness: true
  has_many :products
  # def products
  #   Product.where(supplier_id: id)
  # end
end

# create image url model
# delete image_url currently in products
#update the methods to add inventory_num and supplier_id
