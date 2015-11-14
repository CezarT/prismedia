json.array!(@links) do |link|
  json.extract! link, :id, :user_id, :subject_id, :text, :descr, :image, :rating
  json.url link_url(link, format: :json)
end
