import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      merge(nextState, state, action.pokemon);
      return nextState;
    case RECEIVE_ONE_POKEMON:
      // nextState = Object.assign(nextState, state);
      nextState[action.payload.pokemon.id] = action.payload.pokemon;
      return merge({}, state, nextState);
    default:
      return state;
  }
};
