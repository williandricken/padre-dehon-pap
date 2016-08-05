class DiseaseMedicInfo < ActiveRecord::Base
	belongs_to :medic_info
	belongs_to :disease
end
