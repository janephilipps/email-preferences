json.array!(@users) do |user|
  json.extract! user, :id, :name, :email,:do_not_email, :marketing, :articles, :digest
  json.url user_url(user, format: :json)
end
