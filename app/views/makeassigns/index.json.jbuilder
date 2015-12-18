json.array!(@makeassigns) do |makeassign|
  json.extract! makeassign, :id, :subject_id, :user_id, :start_date, :end_date, :coursesemester_id, :body, :assign_no
  json.url makeassign_url(makeassign, format: :json)
end
