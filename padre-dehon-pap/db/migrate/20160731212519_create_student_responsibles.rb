class CreateStudentResponsibles < ActiveRecord::Migration
  def change
    create_table :student_responsibles do |t|
      t.integer :student_id
      t.integer :responsible_id

      t.timestamps null: false
    end
    add_index :student_responsibles, :student_id
    add_index :student_responsibles, :responsible_id
  end
end
