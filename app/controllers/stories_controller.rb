class StoriesController < ApplicationController

	def new
		@story = Story.new
	end

	def create
		#story_params = params.require(:story).permit(:title, :link, :category)
		@story = Story.new(params[:story])

		if @story.save
			@story.upvotes += 1
			redirect_to @story, :notice => "Successfully created story."
		else
			render :action => 'new'
		end
	end

	def show
		@story = Story.find(params[:id])
	end

	def index
		@stories = Story.all
	end

	def search
		query = params[:q]
		@stories = Story.search_for query
	end

	def destroy
		@story = Story.find(params[:id])
		@story.destroy
		redirect_to root_path, notice: "#{@story.title} hasa been deleted"
	end

end
