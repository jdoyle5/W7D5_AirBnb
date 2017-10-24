class ArtworksController < ApplicationController
  def index
    #index not throwing an error but not giving us artwork at specific index
    artworks = if params[:id]
              Artwork.where(id: params[:id])
            else
              Artwork.all
            end

    render json: artworks
    # render plain: "I'm in the index action!"
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_message, status: 404
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = artwork.find_by(id: params[:id])
    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:artist_id, :title, :image_url)
  end
end
