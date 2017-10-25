class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def show
    @cat = Cat.find(params[:id])
    if @cat
      render :show
    else
      render json: @cat.errors.full_messages, status: 404
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.destroy
      redirect_to cats_url
    else
      render text: "You can't destroy what doesn't exist"
    end
  end

  private

  def cat_params
    params.require(:cats).permit(:name, :birth_date, :color, :sex, :description)
  end
end
