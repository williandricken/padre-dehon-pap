class Employee < ActiveRecord::Base
	has_many :grades, through: :employee_grades
end
