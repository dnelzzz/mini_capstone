json.array! @sorted_products.each do |sorted_product|
  json.id sorted_product.id
  json.name sorted_product.name
  json.price sorted_product.price
  json.description sorted_product.description
  json.discounted sorted_product.is_discounted?
  json.tax sorted_product.tax
  json.total sorted_product.total  
  json.images sorted_product.images
  json.supplier sorted_product.supplier
end