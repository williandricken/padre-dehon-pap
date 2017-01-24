class AddStudentsRefToMedicInfos < ActiveRecord::Migration
  def change  	
    add_reference :medic_infos, :student, index: true, foreign_key: true, unique: true
  end
end
