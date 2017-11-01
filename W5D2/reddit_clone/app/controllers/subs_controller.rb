class SubsController < ApplicationController
  before_action :require_moderator, only: %i(edit)

  def index
    @subs = Sub.all
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save!
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def destroy
    sub = current_user.subs.find(params[:id])
    sub.delete
    redirect_to subs_url
  end

  def require_moderator
    target_sub = Sub.find(params[:id])
    return false unless current_user
    current_user.subs.include?(target_sub)
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
