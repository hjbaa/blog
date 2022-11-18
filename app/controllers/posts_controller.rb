class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @posts = Post.all.order(:created_at)
  end

  # TODO: AJAX TO METHODS BELOW
  def create
  end

  def destroy
  end

  def update
  end
end
