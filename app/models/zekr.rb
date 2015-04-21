class Zekr < ActiveRecord::Base
	belongs_to :user
	has_many :yadavar
	validates_presence_of :name
end
