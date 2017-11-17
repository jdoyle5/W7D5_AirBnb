import { connect } from 'react-redux';
import { selectOnePokemon, selectItems } from '../../reducers/selectors';
import { requestOnePokemon } from '../../actions/pokemon_actions';
import { PokemonDetail } from './pokemon_detail';

const mapStateToProps = (state, ownProps) => {
  return {
    pokemon: selectOnePokemon(state, ownProps.match.params.pokemonId),
    items: selectItems(state)
  };
};

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: (id) => dispatch(requestOnePokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
