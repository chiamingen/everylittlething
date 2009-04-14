class ImageCategoriesController < ApplicationController
	before_filter :load_artist

	def index
		@images_categories = ImageCategory.find(:all, :include => :images, :conditions => ["artist_id = ?", @current_artist.id])
	end

	def show
		@image_category = ImageCategory.find(params[:id])
		@images = Image.paginate_by_image_category_id @image_category.id, :page => params[:page], :per_page => 20
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
		@images = Image.paginate_by_image_category_id @image_category.id, :page => params[:page], :per_page => 20
		@image_categories = ImageCategory.find(:all, :conditions => ["artist_id = ? AND id != ?", @current_artist.id, @image_category.id])
	end

	def destroy
		ImageCategory.destroy(params[:id])
		flash[:notice] = "Category delete successfully"
		redirect_to image_categories_url
	end

	def move_to
		Image.update_all("image_category_id = #{params[:id]}", "id IN(#{params[:image_ids].join(', ')})")
		flash[:notice] = "Selected images moved successfully"
		redirect_to :back
	end
end
