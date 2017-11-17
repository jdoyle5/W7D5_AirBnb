import React from 'react';
import ItemDetailContainer from './item_detail_container';
import { Route, Link } from 'react-router-dom';

export class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestOnePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.match.params.pokemonId !== nextProps.match.params.pokemonId) {
      this.props.requestOnePokemon(nextProps.match.params.pokemonId);
    }
  }

  render() {
    // console.log(this.props);
    const { pokemon, items } = this.props;

    if (!pokemon || !pokemon.moves) {
      return null;
    }
    return (
      <div>
        <img src={pokemon.image_url}/>
        <h2>{pokemon.name}</h2>
        <p>Type: {pokemon.poke_type}</p>
        <p>Attack: {pokemon.attack}</p>
        <p>Defense: {pokemon.defense}</p>
        <p>Moves: {pokemon.moves.join(", ")}</p>
        <div>
          <h3>Items</h3>
          <div>
            {items.map(item => (
              <Link key={item.id} to={`/pokemon/${pokemon.id}/item/${item.id}`}>
                <img key={item.id} src={item.image_url} width="50px" height="50px"/>
              </Link>
            ))}
          </div>
          <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
        </div>
      </div>
    );
  }
}
