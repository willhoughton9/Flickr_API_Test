class Api::V1::HelloController < ApplicationController
	def get_picture
		picture = PictureFinder.new
		#URL list consists of pictures with the given tag name
		url_list_hash = picture.get_picture(params[:name])
		render json: url_list_hash
	end
	
	def display
	end
end