class HelloController < ApplicationController
	def flickr_api_test
	end

	def get_picture
		picture = PictureFinder.new
		url = picture.get_picture(params[:name])
		if url != "invalid"
			redirect_to url 
		else
			redirect_to "/hello/flickr_api_test"
		end
	end
end
