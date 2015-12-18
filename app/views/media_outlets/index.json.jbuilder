json.array!(@media_outlets) do |media_outlet|
  json.extract! media_outlet, :id, :title, :url, :type
  json.url media_outlet_url(media_outlet, format: :json)
end
