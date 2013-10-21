json.array! @user.books do |book|
  json.(book, :id, :name)
end