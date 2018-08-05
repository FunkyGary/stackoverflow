class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :destroy, :favorite, :unfavorite, :upvote, :downvote]

  def index
    @question = Question.new
    @questions = Question.all
    @user = current_user
  end

  def show
    @answer = Answer.new
    @answers = Answer.order(upvotes_count: :desc)
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

  def favorite
    if user_signed_in?
      @question.favorites.create!(user: current_user)
      @question.count_favorites
      redirect_back(fallback_location: root_path)
    else
      redirect_to user_session_path
    end
  end

  def unfavorite
    favorite = Favorite.where(question: @question, user: current_user).first
    favorite.destroy
    @question.count_favorites
    redirect_back(fallback_location: root_path)
  end

  def upvote
    if user_signed_in?
      @question.upvotes.create!(user: current_user)
      @question.count_upvotes
      redirect_back(fallback_location: root_path)
    else
      redirect_to user_session_path
    end
  end

  def downvote
    upvote = Upvote.where(question: @question, user: current_user).first
    upvote.destroy
    @question.count_upvotes
    redirect_back(fallback_location: root_path)
  end

  private

  def question_params
    params.require(:question).permit(:description, :title)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
