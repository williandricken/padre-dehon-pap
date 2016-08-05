class Disease < ActiveRecord::Base
	has_many :disease_medic_infos
	has_many :medic_infos, through: :disease_medic_infos
end
