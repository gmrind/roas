class AddSessionToMakeassigns < ActiveRecord::Migration
  def change
    add_reference :makeassigns, :coursesession, index: true, foreign_key: true
  end
end
