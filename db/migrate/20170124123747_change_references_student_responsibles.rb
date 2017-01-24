class ChangeReferencesStudentResponsibles < ActiveRecord::Migration
  def change
    remove_column :student_responsibles, :student_id
    remove_column :student_responsibles, :responsible_id

    add_reference :student_responsibles, :student, index: true, foreign_key: true
    add_reference :student_responsibles, :responsible, index: true, foreign_key: true
  end
end
