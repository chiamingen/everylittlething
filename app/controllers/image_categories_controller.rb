class ImageCategoriesController < ApplicationController
	before_filter :load_artist

	def index
		@images_categories = ImageCategory.find(:all, :include => :images, :conditions => ["artist_id = ?", @current_artist.id])
	end

	def show
		@image_category = ImageCategory.find(params[:id])
		@images = @image_category.paginated_images(params[:page])
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
	
	def edit
		@image_category = ImageCategory.find(params[:id])
	end

	def update
		@image_category = ImageCategory.find(params[:id])
		if @image_category.update_attributes(params[:image_category])
			flash[:notice] = "Category edited successfully"
			redirect_to image_category_url(@image_category)
		else
			render "edit"
		end
	end

	def organize
		@image_category = ImageCategory.find(params[:id])
		@image_categories = ImageCategory.find(:all, :conditions => ["artist_id = ? AND id != ?", @current_artist.id, @image_category.id])
		@images = @image_category.paginated_images(params[:page])
	end

	def destroy
		ImageCategory.destroy(params[:id])
		flash[:notice] = "Category delete successfully"
		redirect_to image_categories_url
	end

	def move_to
		Image.update_all("imageable_id = #{params[:id]}", "id IN(#{params[:image_ids].join(', ')})")
		flash[:notice] = "Selected images moved successfully"
		redirect_to :back
	end
end
