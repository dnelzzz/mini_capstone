json.array! @suppliers.each do |supplier|
  json.id supplier.id
  json.name supplier.name
  json.email supplier.email
  json.phone_number supplier.phone_number
end