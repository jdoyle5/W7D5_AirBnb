import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ONE_POKEMON:
      return action.payload.ui;
    default:
      return state;
  }
};
