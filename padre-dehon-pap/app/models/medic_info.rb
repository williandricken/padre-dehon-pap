class MedicInfo < ActiveRecord::Base
	has_many :disease_medic_infos
	has_many :diseases, through: :disease_medic_infos

	accepts_nested_attributes_for :diseases
end
