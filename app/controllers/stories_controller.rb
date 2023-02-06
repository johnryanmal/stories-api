class StoriesController < ApplicationController
	before_action :authenticate_user, only: [:create, :update, :destroy]

	def index
		render json: { stories: get_stories, msg: "Retreived." }
	end

	def create
		story = Story.new(story_params)
		if story.save
			render json: { story: story, msg: "Created." }
		end
	end

	def show
		story = get_story
		if story
			render json: { story: story, msg: "Found." }
		end
	end

	def update
		story = get_private_story
		if story&.update(story_params)
			render json: { story: story, msg: "Updated." }
		end
	end

	def destroy
		story = get_private_story
		if story&.destroy&.destroyed?
			render json: { story: story, msg: "Destroyed." }
		end
	end

	def index_user
		render json: { stories: get_private_stories, msg: "Retrieved."}
	end

	private
		def story_params
			params.permit(:title, :public)
			.merge(
				user_id: current_user.id,
				graph: params.require(:graph).permit!
			)
		end

		# index public stories
		def get_stories
			Story.where(public: true)
		end

		# show stories visible to user
		def get_story
			get_private_story || get_stories.find_by(id: params[:id])
		end

		def get_private_stories
			current_user&.stories
		end

		# show stories by user
		def get_private_story
			get_private_stories.find_by(id: params[:id])
		end
end
