class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @user.count_totalupvotes
  end
  
  def edit
    if @user.id != current_user.id
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "user was successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "user was failed to update"
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avator, :name, :intro, :title, :company, :website, :twitter, :github)
  end
end
