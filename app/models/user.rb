class User < ActiveRecord::Base

  #Relationships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  has_one :responsible

  has_one :employee

  has_many :addresses, dependent: :destroy

  #Validations

  validates_email_format_of :email

  validates :email, :password, presence: true
  validates :email, uniqueness: true

  validates :password, length: { minimum: 6 }

  accepts_nested_attributes_for :addresses

  # def oque
  # 	if self.responsible.present?
  #     return self.responsible
  #  else
  #     self.employee
  #   end
  # end

  # def oque_has_job?
  #   if self.employee.present? AND self.employee.job.present?
  #     return self.employee.job
  #   else
  #     puts "sem job"
  #   end
  # end

end
