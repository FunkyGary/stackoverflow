class AnswersController < ApplicationController
  before_action :set_question, only: [:create, :destroy]
  before_action :set_answer, only: [:upvote, :downvote]

  def create
      @answer = @question.answers.build(answer_params)
      @answer.user = current_user
      @answer.save!
      redirect_to question_path(@question)
  end

  def destroy
    @answer = Answer.find(params[:id])
    if current_user
      @answer.destroy
      redirect_to question_path(@question)
    end
  end

  def upvote
    @answer.upvotes.create!(user: current_user)
    @answer.count_upvotes
    redirect_back(fallback_location: root_path)
  end

  def downvote
    upvotes = Upvote.where(answer: @answer, user: current_user).first
    upvotes.destroy
    @answer.count_upvotes
    redirect_back(fallback_location: root_path)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
