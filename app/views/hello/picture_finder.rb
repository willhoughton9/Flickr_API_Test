# we will retrieve some photos and print them to the file system
require 'flickraw'
#require 'launchy'


class PictureFinder


def get_picture(name)
  FlickRaw.api_key = '7a4acf49b95245125c3c33807363f635'
  FlickRaw.shared_secret = '966dc77777a5aaf7'
  list = flickr.photos.search(tags: name)
  if !list.empty?
    # let's get the photo_id for the first picture in the list
    photo_id = list.first.id if list > 0
    photo = flickr.photos.getInfo(photo_id: photo_id)

    # get the photo url
    # url_b means image large
    photo_url = FlickRaw.url_b(photo)
    # print the photo_url to the console
  else
    photo_url = "invalid"
  end

end

end

