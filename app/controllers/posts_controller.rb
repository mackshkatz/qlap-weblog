class PostsController < ApplicationController

	# http_basic_authenticate_with :username => "quickleft", :password => "max"

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path
		else
			render new_post_path
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to posts_path
		else
			render edit_post_path
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			redirect_to posts_path
		else
			render post_path
		end
	end
end
