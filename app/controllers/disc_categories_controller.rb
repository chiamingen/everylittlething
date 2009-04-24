class DiscCategoriesController < ApplicationController
	before_filter :load_artist

	def new
		@disc_category = DiscCategory.new
	end

	def create
		@disc_category = DiscCategory.new(params[:disc_category])
		@disc_category.artist_id = @current_artist.id
		if @disc_category.save
			flash[:notice] = "Category created successfully"
			redirect_to disc_categories_url
		else
			render "new"
		end
	end
	
end
