class DiaryController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @diaries = Diary.all
  end

  def create
  end

  def new
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
