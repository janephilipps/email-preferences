json.array!(@tokens) do |token|
  json.extract! token, :id, :nonce, :user_id
  json.url token_url(token, format: :json)
end
