module ApplicationHelper
	def gravatar_for(user)
		email_address = user.email.downcase
		hash = Digest::MD5.hexdigest(email_address)
		gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
		image_tag(gravatar_url,alt:user.email,size:100,class:'profile_pic')
	end	
	
end
