class HelloController < ApplicationController
 
  def flickr_api_test
  end

  def get_picture
    picture = PictureFinder.new
    url = picture.get_picture(params[:name])
    redirect_to url 

  end
end
