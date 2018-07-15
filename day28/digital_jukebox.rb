# Digital Jukebox

# Create jukebox
# Albums << jukebox
# songs << jukebox
# artists. Songs has artists in it.

# Play songs inside album and pass on to next album.
# pause song. Play next song. Play previous song.
# Create playlists. Add songs to playlists.

class Jukebox
 attr_accessor :name
 @@albums = []
  def self.albums
    @@albums
  end

  def initialize(name)
    @name = name
  end

  def playlists
    @@albums.select{|album| album.type == "playlist"}
  end
end

class Album < Jukebox
  attr_accessor :name, :songs
  attr_reader :type
  def initialize(name, type = "album")
    @name = name
    @type = type
    @songs = []
    @type.freeze
    Jukebox.albums << self
  end

  def play
    songs.each do |song|
      duration = song.duration
      puts "Playing #{song.name}"
      loop do
        break if duration == 0
        puts duration
        sleep 1
        duration -= 1
      end
    end
  end
end

class Song
  attr_accessor :name, :duration, :artist
  def initialize(name, artist = nil, duration = nil)
    @name = name
    @artist = artist
    @duration = duration
  end
end

class Artist < Song
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

tamil_jukebox = Jukebox.new("Tamil songs")
album1 = Album.new("album1")
album2 = Album.new("album2")
album3 = Album.new("album3")
playlist = Album.new("playlist1", "playlist")
# p album1.class.superclass.name
song1 = Song.new("song1", nil, 10)
song2 = Song.new("song2", nil, 10)
song3 = Song.new("song3", nil, 10)

album1.songs << song1
album1.songs << song2
album1.songs << song3

album2.songs << song1
album2.songs << song3

playlist << song1
playlist << song2

# album1.play
p tamil_jukebox.playlists
