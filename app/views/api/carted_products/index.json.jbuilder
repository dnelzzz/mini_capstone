json.array! @carted_products.each do |carted_product|\
  json.current_user current_user.name
  json.product_id carted_product.product_id
  json.quantity carted_product.quantity
  json.status carted_product.status
end