class ImagesController < ApplicationController
	def index
	end

	def new
		if params[:image_category_id]
			@image_category = ImageCategory.find(params[:image_category_id])
			@upload_url = image_category_images_url(@image_category)
		else
			@disc = Disc.find(params[:disc_id])
			@upload_url = disc_images_url(@disc)
		end
	end

	def create
		if params[:image_category_id]
			@obj = ImageCategory.find(params[:image_category_id])
		else
			@obj = Disc.find(params[:disc_id])
		end
		@image = @obj.images.build(params[:image])
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
		redirect_to :back
	end

	def destroy_all
		Image.destroy(params[:image_ids])
		flash[:notice] = "Image deleted successfully"
		redirect_to :back
	end
end
