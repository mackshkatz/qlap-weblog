class PostsController < ApplicationController

	def index
		@posts = Post.all
		#@posts = Post.all(:order => "title") This worked, but sorted the uppercase to be ahead of lowercase.

		# @posts.order("title")
		@posts.sort! do |a,b|
			a.title.downcase <=> b.title.downcase
		end
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
