json.array!(@posts) do |post|
  json.extract! post, :id, :id, :user_id, :post_date, :content, :published
  json.url post_url(post, format: :json)
end
