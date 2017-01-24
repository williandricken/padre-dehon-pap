class ChangeReferencesStudentBehaviors < ActiveRecord::Migration
  def change
    remove_column :student_behaviors, :student_id
    remove_column :student_behaviors, :behavior_id

    add_reference :student_behaviors, :student, index: true, foreign_key: true
    add_reference :student_behaviors, :behavior, index: true, foreign_key: true
  end
end
