class Coursesession < ActiveRecord::Base
  belongs_to  :user
  has_many    :sessionenrolls, dependent: :destroy
  has_many    :makeassigns

  validates   :name,  presence: true
end
