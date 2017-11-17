if guest.age.between?(40, 50)
  json.extract! guest, :name, :age, :favorite_color
  # json.name guest.name
  # json.age guest.age
  # json.favorite_color guest.favorite_color
end
