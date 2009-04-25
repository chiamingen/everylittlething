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
			redirect_to discs_url
		else
			render "new"
		end
	end
	
	def edit
		@disc_category = DiscCategory.find(params[:id])
	end

	def update
		@disc_category = DiscCategory.find(params[:id])
		if @disc_category.update_attributes(params[:disc_category])
			flash[:notice] = "Category edited successfully"
			redirect_to discs_url
		else
			render "edit"
		end
	end

	def destroy
		DiscCategory.destroy(params[:id])
		flash[:notice] = "Category delete successfully"
		redirect_to discs_url
	end
end
