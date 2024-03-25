# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new create_params
    if @user.save
      flash[:success] = 'Register success'
      return redirect_to users_path
    end

    flash[:danger] = @user.errors.full_messages
    redirect_to signup_path
  end

  def show
    @user = User.find_by id: params[:id]
  end

  private

  def create_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
