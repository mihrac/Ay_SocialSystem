module UsersHelper
def avatar_for(user)
if user.avatar?
	image_tag user.avatar.url(:thumb)
else
	image_tag "thumb_default-avatar.png"
end
end


def small_pic_for(user)
	if user.avatar?
	image_tag user.avatar.url(:small)
else
	image_tag "small_default-avatar.png"
end

	end


	def medprofile(user)
	if user.avatar?
	image_tag user.avatar.url(:medprofile)
else
	image_tag "small_default-avatar.png"
end

	end




end
