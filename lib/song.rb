class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.each { |song| return song if song.name == song_name }
    nil
  end

  def self.find_or_create_by_name(song_name)
    find = self.find_by_name(song_name)

    find ? find : self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song = file.split(" - ")
    artist = song[0]
    name = song[1][0..-5]

    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song = file.split(" - ")
    artist = song[0]
    name = song[1][0..-5]

    song = self.find_or_create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
