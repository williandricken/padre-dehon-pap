class AddWeightAndHeightToMedicInfos < ActiveRecord::Migration
  def change
  	add_column :medic_infos, :weight, :float
  	add_column :medic_infos, :height, :float
  end
end
