json.array!(@quotes) do |quote|
  json.extract! quote, :id, :link_id, :user_id, :q
  json.url quote_url(quote, format: :json)
end
