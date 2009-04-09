class ImageCategoriesController < ApplicationController
	before_filter :load_artist

	def index
		@images_categories = ImageCategory.find(:all)
	end

	def show
		@image_category = ImageCategory.find(params[:id])
		@images = @image_category.images
	end

	def new
		@image_category = ImageCategory.new
	end

	def create
		@image_category = ImageCategory.new(params[:image_category])
		@image_category.artist_id = @current_artist.id
		if @image_category.save
			flash[:notice] = "Category created successfully"
			redirect_to image_categories_url
		else
			render "new"
		end
	end

	def destroy
		ImageCategory.destroy(params[:id])
		flash[:notice] = "Category delete successfully"
		redirect_to image_categories_url
	end
end
