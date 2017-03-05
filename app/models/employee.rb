class Employee < ActiveRecord::Base

	#Relationships

	has_many :employee_grades
	has_many :grades, through: :employee_grades

	belongs_to :user, dependent: :destroy

	#Validations

	validates :name, :age, :schooling, :job, presence: true

	accepts_nested_attributes_for :user
end
