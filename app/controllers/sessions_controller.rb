# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    user = User.find_by email: params[:sessions][:email]
    if user&.authenticate(params[:sessions][:password])
      flash[:success] = 'Login success'
      log_in user
      return redirect_to user
    end

    flash[:danger] = 'Invalid email/password combination'
    redirect_to login_path
  end

  def destroy
    log_out
    flash[:success] = 'You are logged out'
    redirect_to login_path
  end
end
