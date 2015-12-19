class Makeassign < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  belongs_to :coursesemester
  belongs_to :coursesession
  has_many   :submissions
end
