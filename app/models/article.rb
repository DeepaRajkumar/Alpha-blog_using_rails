class Article < ApplicationRecord
	belongs_to :customer
	validates :title, presence:true, length:{minimum:4,maxmium:100}
	validates :description , presence:true, length:{minimum:4,maxmium:350}
end	
