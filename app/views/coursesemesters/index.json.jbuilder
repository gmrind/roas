json.array!(@coursesemesters) do |coursesemester|
  json.extract! coursesemester, :id, :name, :course_id, :user_id
  json.url coursesemester_url(coursesemester, format: :json)
end
