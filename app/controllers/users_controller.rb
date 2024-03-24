# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = 'Register success'
      return redirect_to users_path
    end

    flash[:danger] = @user.errors.full_messages
    redirect_to new_user_path
  end

  def show
    @user = User.find_by id: params[:id]
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
