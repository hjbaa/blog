class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :find_post, only: %i[destroy update like dislike]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def subscription_index
    @posts = Post.subscribed_by(current_user)
  end

  def create
    @diary = Diary.find(params[:diary_id])
    @post = @diary.posts.create(post_params.merge(author: current_user))
  end

  def destroy
    return head(:forbidden) unless current_user.author_of?(@post)

    @post.destroy
  end

  def update
    return head(:forbidden) unless current_user.author_of?(@post)

    @post.update(post_params)
  end

  def like
    if current_user.liked?(@post)
      current_user.unlike @post
    else
      current_user.likes @post
    end
  end

  def dislike
    if current_user.disliked?(@post)
      current_user.undislike @post
    else
      current_user.dislikes @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :title, files: [])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
