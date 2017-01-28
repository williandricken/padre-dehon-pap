class Employee < ActiveRecord::Base
	has_many :grades, through: :employee_grades

	belongs_to :user, :dependent => :destroy

	accepts_nested_attributes_for :user
end
