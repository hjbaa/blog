class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_post, only: %i[destroy update]

  def index
    @posts = Post.all.order(:created_at)
  end

  def create
    @diary = Diary.find(params[:diary_id])
    @post = @diary.posts.create(post_params.merge(author: current_user))
  end

  def destroy
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
