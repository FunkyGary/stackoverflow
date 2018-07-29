class AnswersController < ApplicationController
  before_action :set_question, only: [:create, :destroy]

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

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
