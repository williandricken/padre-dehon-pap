class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :employees, :type, :job
  end
end
