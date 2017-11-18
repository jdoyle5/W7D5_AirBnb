class Api::SessionsController < ApplicationController
  def create
    @user = User.find(params[:id])

    if @user.save
      render :show
    else
      render json: ['Invalid credentials'], status: 422
    end
  end

  def destroy
    @session = Session.find_by(session_token: session[:session_token])
    if @session
      @session.destroy
      render json: {}
    else
      render json: @session.errors.full_messages, status: 404
    end
  end
end
