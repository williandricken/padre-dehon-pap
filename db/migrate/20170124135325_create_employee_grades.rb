class CreateEmployeeGrades < ActiveRecord::Migration
  def change
    create_table :employee_grades do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :grade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
