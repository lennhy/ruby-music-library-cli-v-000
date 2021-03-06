require "pry"
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(path) #put the list of files in the files directory!
    files.delete_if do |file| #iterate and delete if there are any ".." or "."
      file == ".." || file =="."
    end
  end

  # imports the files into the library by creating songs from a filename
  def import
    files.each do |filename|
       song = Song.create_from_filename(filename)
    end
  end

  # print songs to the CLI
  # list artists
  # list genres
  def print_songs
    files.sort.each_with_index do |filename, i|
      puts "#{i+1}. #{filename.gsub(".mp3", "")}"
    end
  end

  # print artists to the CLI
  def print_artists
    files.sort.each do |filename|
      puts Song.create_from_filename(filename).artist.name
    end
  end

  # print genres to the CLI
  def print_genres
    files.sort.each do |filename|
      puts Song.create_from_filename(filename).genre.name
    end
  end

  # print artists to the CLI
  def play_song
    files.sort.each_with_index do |filename, i|
      puts "Playing #{filename.gsub(".mp3", "")}"
    end
  end

end
