class Coursesession < ActiveRecord::Base
  belongs_to  :user
  has_many    :sessionenrolls, dependent: :destroy
  has_many    :makeassigns
end
