class Subject < ActiveRecord::Base
  belongs_to :user
  belongs_to :coursesemester
  has_many   :makeassigns
end
