class SongsController < ApplicationController
	def upload
		@song= Song.find(params[:id])
		@song.data = params[:Filedata]
		if @song.save_mp3
			render :text => "Song uploaded successfully", :status => 200
		else
			render :text => "fail to upload song", :status => 500
		end
	end
end
