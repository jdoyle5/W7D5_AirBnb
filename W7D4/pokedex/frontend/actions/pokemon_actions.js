import { fetchAllPokemon, fetchOnePokemon, fetchOneItem, createNewPokemon} from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_ONE_POKEMON = 'RECEIVE_ONE_POKEMON';
export const RECEIVE_ONE_ITEM = 'REQUEST_ONE_ITEM';
export const CREATE_POKEMON = 'CREATE_POKEMON';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});
export const receiveOnePokemon = payload => ({
  type: RECEIVE_ONE_POKEMON,
  payload
});

export const receivePokemonItem = payload => ({
  type: RECEIVE_ONE_ITEM,
  payload
});

export const receiveNewPokemon = payload => ({
  type: CREATE_POKEMON,
  payload
});

export const requestAllPokemon = () => dispatch => (
  fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);
export const requestOnePokemon = id => dispatch => (
  fetchOnePokemon(id)
    .then(pokemon => dispatch(receiveOnePokemon(pokemon)))
);

export const createPokemon = poke => dispatch => (
  createNewPokemon(poke)
    .then(pokemon => dispatch(receiveOnePokemon(pokemon)))
);
// export const requestOneItem = (pokeId, itemId) => dispatch => (
//   fetchOneItem(pokeId, itemId)
//     .then(pokemon => dispatch(receivePokemonItem))
// );
// export const REQUEST_ALL_POKEMON = 'REQUEST_ALL_POKEMON';
