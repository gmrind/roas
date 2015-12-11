class CreateCoursesemesters < ActiveRecord::Migration
  def change
    create_table :coursesemesters do |t|
      t.string :name
      t.references :course, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
