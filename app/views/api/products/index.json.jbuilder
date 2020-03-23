json.array! @sorted_products.each do |sorted_product|
  json.id sorted_product.id
  json.name sorted_product.name
  json.price sorted_product.price
  json.image_url sorted_product.image_url
  json.description sorted_product.description
  json.discounted sorted_product.is_discounted?
  json.tax sorted_product.tax
  json.total sorted_product.total  
  json.supplier sorted_product.supplier
end