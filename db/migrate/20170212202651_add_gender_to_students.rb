class AddGenderToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :gender, :string, limit: 1
  end
end
