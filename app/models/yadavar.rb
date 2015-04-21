class Yadavar < ActiveRecord::Base
	#belongs_to :namaz
	#belongs_to :zekr
	belongs_to :user
	validates_presence_of :saat
	validates_presence_of :min
end
