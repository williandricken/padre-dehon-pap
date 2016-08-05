class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.string :schooling

      t.timestamps null: false
    end
  end
end
