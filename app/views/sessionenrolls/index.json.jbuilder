json.array!(@sessionenrolls) do |sessionenroll|
  json.extract! sessionenroll, :id, :coursesession_id, :user_id
  json.url sessionenroll_url(sessionenroll, format: :json)
end
