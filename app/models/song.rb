class Song < ActiveRecord::Base
	belongs_to :discs
	attr_accessor :data


	def save_mp3
		self.filename = Digest::MD5.hexdigest(Time.now.to_i.to_s) + File.extname(self.data.original_filename)
		song_path = File.join(SONG_DIR, self.filename)

		File.open(song_path, "w") do | f |
			f.write(self.data.read)
		end
		self.save
	end
end
