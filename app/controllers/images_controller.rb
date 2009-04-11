class ImagesController < ApplicationController
	def index
	end

	def new
		@image_category = ImageCategory.find(params[:image_category_id])
		@image = @image_category.images.build
	end

	def create
		@image_category = ImageCategory.find(params[:image_category_id])
		@image = @image_category.images.build(params[:image])
		@image.data = params[:Filedata]
		if @image.save
			render :text => "Image uploaded successfully", :status => 200
		else
			render :text => "fail to upload image", :status => 500
		end
	end

	def destroy
		Image.destroy(params[:id])
		flash[:notice] = "Image deleted successfully"
		redirect_to images_url
	end
end
