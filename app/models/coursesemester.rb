class Coursesemester < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many   :subjects
  has_many   :makeassigns
end
