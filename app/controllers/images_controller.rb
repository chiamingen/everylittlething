class ImagesController < ApplicationController
	def index
		@images = Image.find(:all)
	end

	def new
		@image_category = ImageCategory.find(params[:image_category_id])
		@image = @image_category.images.build
	end

	def create
		@image_category = ImageCategory.find(params[:image_category_id])
		@image = @image_category.images.build(params[:image])
		if @image.save
			flash[:notice] = "Image uploaded successfully"
			redirect_to image_category_url(@image_category)
		else
			render "new"
		end
	end

	def destroy
		Image.destroy(params[:id])
		flash[:notice] = "Image deleted successfully"
		redirect_to images_url
	end
end
