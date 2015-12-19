class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :makeassign

  validates  :roll_no,  presence: true
  validates  :sub_body, presence: true
end
