import { connect } from 'react-redux';
import { ItemDetail } from './item_detail';
import { selectPokemonItem } from '../../reducers/selectors';
import { requestPokemonItem } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, ownProps.match.params.itemId)
});

// const mapDispatchToProps = dispatch => ({
//   requestPokemonItem: () => dispatch(requestPokemonItem())
// });

export default connect(mapStateToProps, {})(ItemDetail);
