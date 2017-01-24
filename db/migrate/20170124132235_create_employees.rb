class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.string :schooling
      t.string :type

      t.timestamps null: false
    end
  end
end
