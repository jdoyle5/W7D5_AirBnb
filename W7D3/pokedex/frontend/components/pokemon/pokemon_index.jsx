import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';

export class PokemonIndex extends React.Component {
  render() {
    const { pokemon } = this.props;
    return (
      <section className="pokedex">
        <ol>
          {pokemon.map(poke => (
            <PokemonIndexItem key={poke.name} props={poke}/>
          ))}
        </ol>
      </section>
    );
  }

  componentDidMount () {
    this.props.requestAllPokemon();
  }
}
