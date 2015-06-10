require 'json'
require 'open-uri'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"

  def get_url(region)
    "#{BASE_URL}/#{region}/weekly/latest"
  end

  def get_json(url)
    # load json given a url here
    JSON.load(open(url))
    # refer to the references if you have questions about this
  end

  def get_first_track_info(music_hash)
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }
    new_hash = music_hash["tracks"].first
    string = "#{new_hash["track_name"]} by #{new_hash["artist_name"]} from the album #{new_hash["album_name"]}"
    # given a hash, like the one above, this method should return a string like:
    # <track name> by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array
    string
  end


  def most_streamed(region)
    # call on #get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable
    url = get_url(region)
    # call on #get_json here, using the string that get_url returns
    hash = get_json(url)
    # finally, call on #get_first_track_info using the 
    # hash that #get_json returns

    get_first_track_info(hash)
  end

end
