json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :user_id, :coursesemester_id
  json.url subject_url(subject, format: :json)
end
