json.array!(@takes) do |take|
  json.extract! take, :id, :course_id
  json.url take_url(take, format: :json)
end
