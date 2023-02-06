class StoriesController < ApplicationController
	def index
		render json: { stories: Story.all, msg: "Retreived." }
	end

	def create
		story = Story.new(story_params)
		if story.save
			render json: { story: story, msg: "Created." }
		end
	end

	def show
		story = Story.find_by(id: params[:id])
		if story
			render json: { story: story, msg: "Found." }
		end
	end

	def update
		story = Story.find_by(id: params[:id])
		if story&.update(story_params)
			render json: { story: story, msg: "Updated." }
		end
	end

	def destroy
		story = Story.find_by(id: params[:id])
		if story&.destroy&.destroyed?
			render json: { story: story, msg: "Destroyed." }
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
