json.extract! saved_reply, :id, :title, :body, :created_at, :updated_at
json.url saved_reply_url(saved_reply, format: :json)
json.body saved_reply.body.to_s
