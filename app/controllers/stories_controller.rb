class StoriesController < ApplicationController
	before_action :authenticate_user, only: [:create, :update, :destroy]

	def index
		stories = render_stories(get_stories, owned: false)
		private_stories = render_stories(get_private_stories, owned: true)
		render json: { stories: stories + private_stories, msg: "Retreived." }
	end

	def create
		story = Story.new(story_params)
		if story.save
			render json: { story: render_story(story), msg: "Created." }
		end
	end

	def show
		if (story = get_private_story)
			render json: { story: render_story(story, owned: true), msg: "Found." }
		elsif (story = get_story)
			render json: { story: render_story(story, owned: false), msg: "Found." }
		end
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
		stories = render_stories(get_private_stories, owned: true)
		render json: { stories: stories, msg: "Retrieved."}
	end

	private
		def story_params
			params.permit(:title, :public, graph: {})
			.merge(
				user_id: current_user.id
			)
		end

		# index public stories
		def get_stories
			Story.where(public: true)
		end

		# show stories visible to user
		def get_story
			get_stories.find_by(id: params[:id])
		end

		def get_private_stories
			current_user&.stories || Story.none
		end

		# show stories by user
		def get_private_story
			get_private_stories.find_by(id: params[:id])
		end

		def render_stories(stories, **kwargs)
			stories.as_json(except: [:graph]).map{ |story| story.merge(**kwargs) }
		end

		def render_story(story, **kwargs)
			story.as_json.merge(**kwargs)
		end
end
