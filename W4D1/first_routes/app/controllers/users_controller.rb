class UsersController < ApplicationController
  def index
    #index not throwing an error but not giving us user at specific index
    users = if params[:id]
              User.where(id: params[:id])
            else
              User.all
            end

    render json: users
    # render plain: "I'm in the index action!"
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_message, status: 404
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
