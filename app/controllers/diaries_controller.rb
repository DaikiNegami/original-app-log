class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @diaries = Diary.all
  end
  
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end

  private

  def diary_params
    params.require(:diary).permit(:image, :title, :text,).merge(user_id: current_user.id)
  end

end
