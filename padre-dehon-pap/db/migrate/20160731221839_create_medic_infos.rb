class CreateMedicInfos < ActiveRecord::Migration
  def change
    create_table :medic_infos do |t|
      t.string :surgery, default: 'Não'
      t.string :treatment, default: 'Não'
      t.string :allergic, default: 'Não'
      t.string :intolerant, default: 'Não'

      t.timestamps null: false
    end
  end
end
