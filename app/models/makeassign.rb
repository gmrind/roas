class Makeassign < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  belongs_to :coursesemester
  belongs_to :coursesession
  has_many   :submissions

  validates  :assign_no,    presence: true
  validates  :start_date,   presence: true
  validates  :end_date,     presence: true
  validates  :body,         presence: true
end
