class StoriesController < ApplicationController
	def index
		render json: Story.all
	end

	def create
		story = Story.new(story_params)
		if story.save
			render json: story
		end
	end

	def show
		story = Story.find_by(id: params[:id])
		if story
			render json: story
		end
	end

	def update
		story = Story.find_by(id: params[:id])
		if story&.update(story_params)
			render json: story
		end
	end

	def destroy
		story = Story.find_by(id: params[:id])
		if story&.destroy&.destroyed?
			render json: { msg: "Destroyed." }
		end
	end

	private
		def story_params
			{
				title: params[:title],
				graph: params[:graph]
			}
		end
end
