class AlbumForamtter
  def initialize(album)
    @album = album
  end

  def print_album
    puts "Title: #{@album['title']}"
    puts "Artist: #{@album['artists'].first['name']}"
    puts "Music Genre: #{@album['genres'].join(', ')}"
    puts "Style: #{@album['styles'].join(', ')}"
    puts 'TrackList:'
    @album['tracklist'].each do |track|
      puts "#{track['position']}\t [#{track['duration']}]\t#{track['title']}"
    end
  end
end
