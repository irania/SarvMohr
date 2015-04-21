class Ruze < ActiveRecord::Base
	belongs_to :user
	has_many :yadavareruze
	validates_presence_of :name
end
