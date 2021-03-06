class PostsController < ApplicationController

	def index
		@posts = Post.all(:order => "title")
		# @posts.sort! do |a,b|
		# 	a.title.downcase <=> b.title.downcase
		# end
		# ^ This way worked using the ruby method sort!, but a more efficient way is to create your custom SQL query using the :order option.
		

		# if params[:whatever]
		# 	@posts = dadajdjadj
		# elsif params[:random]
		# 	@posts = Post.find(:first, :order => 'RAND()')
		# else
		# 	@posts = Post.all(:order => "title")
		# end
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
