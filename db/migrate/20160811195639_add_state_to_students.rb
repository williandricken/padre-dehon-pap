class AddStateToStudents < ActiveRecord::Migration
  def change
    add_column :students, :state, :string, limit: 2
  end
end
