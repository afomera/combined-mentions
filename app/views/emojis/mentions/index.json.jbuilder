json.array! @emojis do |emoji|
  json.type "emoji"
  json.name emoji.name
  json.content emoji.raw
end
