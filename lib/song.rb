class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
# Initializes a song and saves it to the @@all 
# class variable either literally or through the 
# class method Song.all. This method should 
# return the song instance that was initialized and saved.
  def self.create
    song = self.new
    song.save
    song
  end
# Song.new_by_name takes in the string name of a song and 
# returns a song instance with that name set as its name 
# property. Song.new_by_name should return an instance of 
# Song and not a simple string or anything else. 
  def self.new_by_name(name)
  song = self.new
  song.name = name
  song
  end
  
# Song.create_by_name takes in the string name of a song 
# and returns a song instance with that name set as its name 
# property and the song being saved into the @@all class variable.
  def self.create_by_name(name)
    song = self.new
    song.name = name
# Puts song in @@all via save method above
    song.save 
# Returns value of new instance of song.
    song
  end
  
# Accepts the string name of a song and returns the 
# matching instance of the song with that name
  def self.find_by_name(name)
    @@all.detect{ |song| song.name == name }
  end
# Accept a string name for a song and either return a matching 
# song instance with that name or create a new song with the 
# name and return the song instance.

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
# If it exists, use find_by_name method above
        self.find_by_name(name)
    else
# Or it creates a new song using method above
      self.create_by_name(name)
    end
  end

# Return all songs in ascending alphabetical order.
  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

# Song.new_from_filename("Taylor Swift - Blank Space.mp3"), 
# the constructor should return a new Song instance with 
# the song name set to Blank Space and the artist_name set to Taylor Swift. 
# The filename input sent to Song.new_from_filename in the format of 
# Taylor Swift - Blank Space.mp3 must be parsed for the relevant components. 
# Separate the artist name from the rest of the data based on the - delimiter. 
# Don't forget that when you parse the song name, 
# you have to remove the '.mp3' part of the string.
  def self.new_from_filename(file_name)
  split_array = file_name.chomp(".mp3").split(" - ")
  song = Song.new
  song.artist_name = split_array[0]
  song.name = split_array[1]
  song
  end

# Same as above, adding save functionality into it
  def self.create_from_filename(file_name)
    split_array = file_name.chomp(".mp3").split(" - ")
    song = Song.new
    song.artist_name = split_array[0]
    song.name = split_array[1]
    song.save
    song
  end

# Clears the @@all array, many ways to do so.
  def self.destroy_all
    @@all.clear
  end
end
