class Course < ActiveRecord::Base
  belongs_to :user
  has_many   :coursesemesters

  validates  :title, presence: true
end
