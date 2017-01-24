class StudentResponsible < ActiveRecord::Base
	belongs_to :student
	belongs_to :responsible
end
