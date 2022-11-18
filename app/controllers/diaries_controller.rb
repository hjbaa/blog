class DiariesController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :find_diary, only: %i[destroy update]

  def create
    @diary = Diary.create(diary_params.merge(author: current_user))
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])

    if current_user == @user
      @diary = @user.diary || Diary.new(author: current_user)
      @post = Post.new
    else
      @diary = @user.diary
    end
  end

  def destroy
    return head(:forbidden) unless current_user.author_of?(@diary)

    @diary.destroy
    flash[:success] = 'Your blog was destroyed!'

    redirect_to root_path
  end

  def update
    return head(:forbidden) unless current_user.author_of?(@diary)

    @diary.update(diary_params)
  end

  private

  def diary_params
    params.require(:diary).permit(:description)
  end

  def find_diary
    @diary = Diary.find(params[:id])
  end
end
