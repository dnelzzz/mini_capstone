 class Category < ApplicationRecord
  has_many :category_products

  has_many :products
  has_many :products, through: :category_products

  # def products
    # result = []
    # category_products.each do |category_products|
    #   result << category_products.product 
    # end
    # return result
  #   result = category_products.map {|category_product| category_product.product}
  #   return result
  # end
  
end
