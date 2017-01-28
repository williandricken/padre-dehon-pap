class Student < ActiveRecord::Base
	has_many :student_behaviors
	has_many :behaviors, through: :student_behaviors

	has_many :grades, through: :student_grades

	has_many :student_responsibles
	has_many :responsibles, through: :student_responsibles

	has_one :medic_info, :dependent => :destroy

	accepts_nested_attributes_for :medic_info

	accepts_nested_attributes_for :behaviors

	# accepts_nested_attributes_for :responsibles
end
