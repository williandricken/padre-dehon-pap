class CreateStudentGrades < ActiveRecord::Migration
  def change
    create_table :student_grades do |t|
      t.references :student, index: true, foreign_key: true
      t.references :grade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
