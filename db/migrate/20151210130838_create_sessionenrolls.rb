class CreateSessionenrolls < ActiveRecord::Migration
  def change
    create_table :sessionenrolls do |t|
      t.references :coursesession, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
