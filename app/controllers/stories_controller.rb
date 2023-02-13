class StoriesController < ApplicationController
	before_action :authenticate_user, only: [:create, :update, :destroy]

	def index
		stories = get_stories
		render json: { stories: render_stories(stories), msg: "Retreived." }
	end

	def create
		story = Story.new(story_params)
		if story.save
			render json: { story: render_story(story), msg: "Created." }
		end
	end

	def show
		story = get_story
		render json: { story: render_story(story), msg: "Found." }
	end

	def update
		story = get_private_story
		if story&.update(story_params)
			render json: { story: render_story(story), msg: "Updated." }
		end
	end

	def destroy
		story = get_private_story
		if story&.destroy&.destroyed?
			render json: { story: render_story(story), msg: "Destroyed." }
		end
	end

	def index_user
		stories = get_private_stories
		render json: { stories: render_stories(stories), msg: "Retrieved."}
	end

	private
		def story_params
			params.permit(:title, :description, :public, graph: {})
			.merge(
				user_id: current_user.id
			)
		end

		# stories visible to user
		def get_stories
			get_public_stories.or(get_private_stories)
		end

		def get_story
			get_stories.find_by(id: params[:id])
		end

		# public stories
		def get_public_stories
			Story.where(public: true)
		end

		# stories by user
		def get_private_stories
			current_user&.stories || Story.none
		end

		def get_private_story
			get_private_stories.find_by(id: params[:id])
		end

		def render_stories(stories, **kwargs)
			stories.map do |story|
				render_story(story, except: [:graph], **kwargs)
			end
		end

		def render_story(story, **kwargs)
			story.as_json(**kwargs).merge(
				owned: (current_user && current_user.id == story.user_id) ? true : false
			)
		end
end
