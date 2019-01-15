class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)

  	if(@post.save)
      flash[:success] = "Success!"
  		redirect_to post_path(@post)
  	else
      flash[:error] = @post.error.full_messages
  		render 'new'
  	end
  end

  private 

    def post_params
  	 params.require(:post).permit(:image, :description)
    end

end
