class ChangeReferencesDiseaseMedicInfos < ActiveRecord::Migration
  def change
    remove_column :disease_medic_infos, :disease_id
    remove_column :disease_medic_infos, :medic_info_id

    add_reference :disease_medic_infos, :disease, index: true, foreign_key: true
    add_reference :disease_medic_infos, :medic_info, index: true, foreign_key: true
  end
end
