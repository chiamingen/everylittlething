# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  	def load_artist
  		@current_artist = Artist.find_by_name(current_subdomain)
		if @current_artist.nil?
			flash[:notice] = "Invalid Artist: #{current_subdomain}"
			redirect_to root_url(:subdomain => false)
		end
	end
	
end
