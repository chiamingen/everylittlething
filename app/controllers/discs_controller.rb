class DiscsController < ApplicationController
	before_filter :load_artist
	
	def index
		@disc_categories = DiscCategory.find(:all, :conditions => ["artist_id = ?", @current_artist.id], :include => [ :discs => :images ])
	end
	
	def show
		@disc = Disc.find(params[:id])
	end

	def new
		@disc_category = DiscCategory.find(params[:disc_category_id])
		@disc = @disc_category.discs.build
		@disc.songs.build
		@disc.songs.build
		@disc.songs.build
	end

	def create
		@disc_category = DiscCategory.find(params[:disc_category_id])
		@disc = @disc_category.discs.build(params[:disc])
		if @disc.save
			flash[:notice] = "Disc created successfully"
			redirect_to disc_category_url(@disc_category)
		else
			render "new"
		end
	end

	def edit
		@disc = Disc.find(params[:id])
	end

	def update
		@disc = Disc.find(params[:id])
		if @disc.update_attributes(params[:disc])
			flash[:notice] = "Disc updated succesfully"
			redirect_to disc_category_url(@disc.disc_category_id)
		else
			render "edit"
		end
	end
end