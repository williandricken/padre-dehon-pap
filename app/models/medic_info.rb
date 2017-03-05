class MedicInfo < ActiveRecord::Base
	has_many :disease_medic_infos
	has_many :diseases, through: :disease_medic_infos

	accepts_nested_attributes_for :diseases

	def bmi
		if (!self.weight.present? or !self.height.present?)
			return "Aluno(a) não tem peso ou altura cadastrado(s)."
		end

		(self.weight / (self.height * self.height)).round(1)
	end
end
