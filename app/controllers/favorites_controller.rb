class FavoritesController < ApplicationController

  def index
    @questions = current_user.favorited_questions
  end
  
end
