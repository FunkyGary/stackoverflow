class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :destroy]

  def index
    @question = Question.new
    @questions = Question.all
    @user = current_user
  end

  def show
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = "Question was successfully created"
      redirect_to root_path
    else
      flash.now[:alert] = "Question was failed to create"
      render :index
    end
  end

  def destroy

    if current_user
      @question.destroy
      redirect_to root_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:description, :title)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
