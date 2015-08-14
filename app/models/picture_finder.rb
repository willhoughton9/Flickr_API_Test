# we will retrieve some photos and print them to the file system
require 'flickraw'

class PictureFinder


  def get_picture(name=nil)
    if name=="csv"
      name = ""
      csv_file_name = "config/folder_image_names3.csv"
      counter = 0
      CSV.foreach(csv_file_name) do |row|
        break if (counter+=1) > 10 # Cookie overflow (using flash hash) / RequestURI (using get params) too large if not limited
        name+="#{row.join(' ')}\n"
      end
    end
    @photos_hash_list = []
    if !name.nil?
      FlickRaw.api_key = '7a4acf49b95245125c3c33807363f635'
      FlickRaw.shared_secret = '966dc77777a5aaf7'
      #Creates arrays for photo urls and the photos themselves.
      #Splits the tags on each newline.
      list = name.split("\n")
      #If the tag list is empty or doesn't exist, then it returns nil. If not, then it continues with the program.
      if list.size == 0
        return nil
      else 
        #For every line of tags in the list
        list.each do |item|
          tags_array = item.split(" ")
          #Search flickr for photos that match all the requested tags
          photo_list = flickr.photos.search(tags: tags_array, tag_mode: 'all')
          if photo_list.size > 0
            #photo = flickr.photos.getInfo(photo_id: photo_item.id)
            photo_url = FlickRaw.url_b(photo_list[Random.new.rand(0..tags_array.size-1)])
            photo_url_hash = {image_url: photo_url , tags_array: tags_array}
            @photos_hash_list << photo_url_hash
          else
            @photos_hash_list << {image_url: nil, tags_array: tags_array}
          end
        end
      end
    else
      return nil
    end
    return @photos_hash_list
  end
end