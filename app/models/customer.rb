class Customer < ApplicationRecord
	has_many:articles
	validates :username,
	          presence:true,
	          uniqueness: {case_sensitive: false},
	          length: {minimum:5,maxmium:100}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email,
    presence:{case_sensitive:false},
    uniqueness: {minimum:5,maxmium:350},
    format: {with:VALID_EMAIL_REGEX}     
end	