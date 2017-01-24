class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :birth_date
      t.string :place_of_birth
      t.integer :school_year
      t.string :start_date
      t.string :another_behavior

      t.timestamps null: false
    end
  end
end
