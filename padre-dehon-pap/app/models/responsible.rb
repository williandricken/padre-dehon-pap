class Responsible < ActiveRecord::Base
	has_many :student_responsibles
	has_many :students, through: :student_responsibles

	belongs_to :user, :dependent => :destroy

	accepts_nested_attributes_for :user
end
