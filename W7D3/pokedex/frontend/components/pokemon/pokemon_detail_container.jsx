import { connect } from 'react-redux';
import { selectAllPokemon } from '../../reducers/selectors';
import { requestOnePokemon } from '../../actions/pokemon_actions';
import { PokemonDetail } from './pokemon_detail';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: (poke) => dispatch(requestOnePokemon(poke))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
