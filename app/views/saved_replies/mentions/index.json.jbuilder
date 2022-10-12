json.array! @saved_replies do |saved_reply|
  json.extract! saved_reply, :id, :title
  json.type "saved_reply"
  json.content saved_reply.body.to_s
end
