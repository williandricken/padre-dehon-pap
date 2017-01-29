class Grade < ActiveRecord::Base

	has_many :student_grades
	has_many :students, through: :student_grades

	has_many :employee_grades
	has_many :employees, through: :employee_grades

end
