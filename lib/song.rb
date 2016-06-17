class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.create
    # @song = Song.new
    @song = Song.new
    @song.save
    @song
  end

  def self.destroy_all
    @@all.clear

  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # def self.create
  #   @@all << Song.new
  # end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    song = @@all.find do |song|
      song.name == name
    end
    song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(".")
    songAndArtist = filename[0].split(" - ")
    song=Song.new

    song.name = songAndArtist[1]
    song.artist_name = songAndArtist[0]

    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end


end
