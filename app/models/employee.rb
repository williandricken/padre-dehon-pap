class Employee < ActiveRecord::Base
	has_many :employee_grades
	has_many :grades, through: :employee_grades

	belongs_to :user, :dependent => :destroy
end
