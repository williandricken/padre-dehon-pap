class PagesController < ApplicationController
	def home;end

	def pages
		render params[:page]
	rescue
		render '404'
	end
end
