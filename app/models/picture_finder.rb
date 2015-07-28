# we will retrieve some photos and print them to the file system
require 'flickraw'

class PictureFinder


  def get_picture(name)
    if name != ""
      FlickRaw.api_key = '7a4acf49b95245125c3c33807363f635'
      FlickRaw.shared_secret = '966dc77777a5aaf7'
      #tags = name.split(" ")
      list = flickr.photos.search(tags: name)
      return photo_url = "invalid" if list.size == 0
      photo = flickr.photos.getInfo(photo_id: list[Random.new.rand(0..list.size-1)].id)

      # get the photo url
      # url_b means image large
      photo_url = FlickRaw.url_b(photo)
      # print the photo_url to the console
    else
      photo_url = "invalid"
    end
  end
end