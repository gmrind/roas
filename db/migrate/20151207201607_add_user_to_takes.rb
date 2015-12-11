class AddUserToTakes < ActiveRecord::Migration
  def change
    add_reference :takes, :user, index: true, foreign_key: true
  end
end
