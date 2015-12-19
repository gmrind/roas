class Sessionenroll < ActiveRecord::Base
  belongs_to :coursesession
  belongs_to :user

  validates  :coursesession_id, presence: true
  validates  :user_id,          presence: true
end
