json.set! :pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :image_url, :moves, :poke_type
end

json.set! :items do
  json.array! @pokemon.items do |item|
    json.id item.id
    json.name item.name
    json.pokemon_id item.pokemon_id
    json.price item.price
    json.happiness item.happiness
    json.image_url item.image_url
  end
end

json.set! :ui do
  json.pokeDisplay @pokemon.id
  json.errors @pokemon.errors
  # json.loading @pokemon.loading
end
