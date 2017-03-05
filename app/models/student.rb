class Student < ActiveRecord::Base

	#Relationships

	has_many :student_behaviors
	has_many :behaviors, through: :student_behaviors

	has_many :student_grades
	has_many :grades, through: :student_grades

	has_many :student_responsibles
	has_many :responsibles, through: :student_responsibles

	has_one :medic_info, :dependent => :destroy

	#Validations

	validates :name, :birth_date, :place_of_birth, :school_year, :start_date, :state, :gender, presence: true

	accepts_nested_attributes_for :medic_info

end
