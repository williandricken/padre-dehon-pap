class RemoveImcFromMedicInfo < ActiveRecord::Migration
  def change
  	remove_column :medic_infos, :IMC
  end
end
