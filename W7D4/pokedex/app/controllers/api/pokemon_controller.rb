class Api::PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.new(poke_params)
    if @pokemon.save
      redirect_to api_pokemon_url(@pokemon.id)
    else
      flash.now[:errors] = @pokemon.errors.full_messages
      render :index
    end
  end

  private

  def poke_params
    params.require(:pokemon).permit(:name, :image_url, :poke_type, :attack,
    :defense, :moves)
  end
end
