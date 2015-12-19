json.array!(@submissions) do |submission|
  json.extract! submission, :id, :user_id, :roll_no, :sub_body, :makeassign_id
  json.url submission_url(submission, format: :json)
end
