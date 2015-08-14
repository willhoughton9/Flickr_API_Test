class HelloController < ApplicationController
	require 'csv'
	def get_picture
		picture = PictureFinder.new
		#URL list consists of pictures with the given tag name
		f_picture_hash_array = picture.get_picture(params[:name])

#		if !f_picture_hash_array.nil?
		flash[:pictures] = f_picture_hash_array
		redirect_to :action => "display"
#		else
#			redirect_to "/hello/flickr_api_test?e=t"
#		end
	end
	
	def display
	end
end
