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
    if user_signed_in?
      @answer.anupvotes.create!(user: current_user)
      @answer.count_answer_upvotes
      redirect_back(fallback_location: root_path)
    else
      redirect_to user_session_path
    end
  end

  def downvote
    if user_signed_in?
      upvote = Anupvote.where(answer: @answer, user: current_user).first
      upvote.destroy
      @answer.count_answer_upvotes
      redirect_back(fallback_location: root_path)
    else
      redirect_to user_session_path
    end
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
