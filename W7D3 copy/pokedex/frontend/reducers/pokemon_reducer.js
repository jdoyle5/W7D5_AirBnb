import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_ONE_POKEMON:
      return action.payload.pokemon;
    default:
      return state;
  }
};
