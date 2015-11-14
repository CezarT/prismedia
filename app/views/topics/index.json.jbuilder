json.array!(@topics) do |topic|
  json.extract! topic, :id, :user_id, :img, :title, :descr
  json.url topic_url(topic, format: :json)
end
