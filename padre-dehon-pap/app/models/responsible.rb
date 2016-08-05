class Responsible < ActiveRecord::Base
	has_many :student_responsibles
	has_many :students, through: :student_responsibles
end
