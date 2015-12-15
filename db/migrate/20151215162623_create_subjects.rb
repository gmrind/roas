class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :coursesemester, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
