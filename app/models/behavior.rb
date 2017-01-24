class Behavior < ActiveRecord::Base
	has_many :student_behaviors
	has_many :students, through: :student_behaviors
end