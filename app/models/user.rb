class User < ActiveRecord::Base
	 has_one :profile
	 has_many :zekr
	 has_many :yadavar
	 has_many :ruze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
