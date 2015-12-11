json.array!(@coursesessions) do |coursesession|
  json.extract! coursesession, :id, :name, :user_id
  json.url coursesession_url(coursesession, format: :json)
end
