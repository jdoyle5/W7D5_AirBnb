import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
// import PokemonFormContainer from './pokemon_form_container';
import { Route, Switch } from 'react-router-dom';

export class PokemonIndex extends React.Component {
  componentDidMount () {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;

    if (!pokemon) {
      return null;
    }
    return (
      <div>
        <aside className="pokedex">
          <ol>
            {pokemon.map(poke => (
              <PokemonIndexItem key={poke.name} props={poke}/>
            ))}
          </ol>
        </aside>
        <section className="poke-detail">
          <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        </section>
      </div>
    );
  }
}
