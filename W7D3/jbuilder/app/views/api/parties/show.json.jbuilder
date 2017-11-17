json.partial! 'api/parties/party', party: @party

json.guests @party.guests do |guest|
  json.name guest.name
  json.age guest.age

  json.gifts guest.gifts do |gift|
    json.title gift.title
    json.description gift.description
  end
end
