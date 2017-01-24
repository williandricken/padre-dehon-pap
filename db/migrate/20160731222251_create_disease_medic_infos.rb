class CreateDiseaseMedicInfos < ActiveRecord::Migration
  def change
    create_table :disease_medic_infos do |t|
      t.integer :disease_id
      t.integer :medic_info_id

      t.timestamps null: false
    end
    add_index :disease_medic_infos, :disease_id
    add_index :disease_medic_infos, :medic_info_id
  end
end
