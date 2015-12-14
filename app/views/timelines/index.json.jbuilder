json.array!(@timelines) do |timeline|
  json.extract! timeline, :id, :user_id, :img, :title, :descr
  json.url timeline_url(timeline, format: :json)
end
