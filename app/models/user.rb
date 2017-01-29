class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  has_one :responsible

  has_one :employee

  has_many :addresses

  accepts_nested_attributes_for :addresses

  def teacher
  	nil
  end 

  def profile
  	teacher || responsible
  end         
end
