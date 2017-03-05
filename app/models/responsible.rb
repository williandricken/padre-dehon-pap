class Responsible < ActiveRecord::Base
	
	#Relationships

	has_many :student_responsibles
	has_many :students, through: :student_responsibles

	belongs_to :user, :dependent => :destroy

	#Validations

	validates :name, :rg, :cpf, :schooling, presence: true

	validates_cpf_format_of :cpf

	validates :cpf, :rg, uniqueness: true

	accepts_nested_attributes_for :user
end
