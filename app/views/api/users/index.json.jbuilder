json.array! @users.each do |user|
  json.name user.name
  json.email user.email
  json.password user.password_digest
  json.user current_user.name
end



