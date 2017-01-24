class CreateStudentBehaviors < ActiveRecord::Migration
  def change
    create_table :student_behaviors do |t|
      t.integer :student_id
      t.integer :behavior_id

      t.timestamps null: false
    end
    add_index :student_behaviors, :student_id
    add_index :student_behaviors, :behavior_id
  end
end
