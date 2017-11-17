import React from 'react';

export const PokemonDetail = poke => {
  const { pokemon, items } = poke.props;
  return(
    <div>
      <img src={pokemon.image_url}/>
      <h2>{pokemon.name}</h2>
      <p>Type: {pokemon.poke_type}</p>
      <p>Attack: {pokemon.attack}</p>
      <p>Defense: {pokemon.defense}</p>
      <p>Moves: {pokemon.moves}</p>
      <div>
        <h3>Items</h3>
        <div>
          //All items
        </div>
      </div>
    </div>
  );
};
