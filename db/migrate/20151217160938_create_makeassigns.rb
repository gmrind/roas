class CreateMakeassigns < ActiveRecord::Migration
  def change
    create_table :makeassigns do |t|
      t.references :subject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :coursesemester, index: true, foreign_key: true
      t.text :body
      t.string :assign_no

      t.timestamps null: false
    end
  end
end
