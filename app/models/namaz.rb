class Namaz < ActiveRecord::Base
	belongs_to :user
	has_many :yadavarenamaz
	validates_presence_of :name
	#validates_numericality_of :tedad_rokat, greater_than: :-1
end
