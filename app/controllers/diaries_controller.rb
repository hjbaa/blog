class DiariesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @diaries = Diary.all
  end

  def create
    @diary = Diary.new(diary_params.merge(author: current_user))

    if @diary.save
      flash[:success] = 'Your diary has been created!'
      redirect_to blog_path(current_user)
    else
      render :new
    end
  end

  def new
    @diary = Diary.new
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def diary_params
    params.require(:diary).permit(:description)
  end
end
