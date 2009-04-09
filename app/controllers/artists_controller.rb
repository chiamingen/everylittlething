class ArtistsController < ApplicationController
	before_filter :load_artist, :only => :show

	def index
		@artists = Artist.find(:all)
	end

	def show
		@artist = Artist.find_by_name(current_subdomain)
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(params[:artist])
		if @artist.save
			flash[:notice] = "Artist created successfully"
			redirect_to artists_url
		else
			render "new"
		end
	end
end
