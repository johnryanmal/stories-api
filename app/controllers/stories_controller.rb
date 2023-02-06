class StoriesController < ApplicationController
	def index
		render json: Story.all
	end

	def show
		story = Story.find_by(id: params[:id])
		if story
			render json: story
		end
	end
end
