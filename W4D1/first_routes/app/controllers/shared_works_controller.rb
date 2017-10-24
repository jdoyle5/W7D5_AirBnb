class SharedWorksController < ApplicationController
  def index
    shared_works = if params[:id]
              SharedWork.where(id: params[:id])
            else
              SharedWork.all
            end

    render json: shared_works
    # render plain: "I'm in the index action!"
  end

  def create
    shared_work = SharedWork.new(shared_work_params)
    if shared_work.save
      render json: shared_work
    else
      render json: shared_work.errors.full_messages, status: 422
    end
  end

  def destroy
    shared_work = SharedWork.find_by(id: params[:id])
    if shared_work.destroy
      render json: shared_work
    else
      render json: shared_work.errors.full_messages, status: 422
    end
  end

  private

  def shared_work_params
    params.require(:shared_work).permit(:artwork_id, :viewer_id)
  end
end
