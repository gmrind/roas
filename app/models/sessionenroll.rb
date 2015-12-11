class Sessionenroll < ActiveRecord::Base
  belongs_to :coursesession
  belongs_to :user
end
