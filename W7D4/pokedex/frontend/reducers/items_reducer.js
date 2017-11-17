import { RECEIVE_ONE_POKEMON, RECEIVE_ONE_ITEM } from '../actions/pokemon_actions';
import { merge } from 'lodash';

export const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};

  switch (action.type) {
    case RECEIVE_ONE_POKEMON:
      return action.payload.items;
    // case RECEIVE_ONE_ITEM:
    //   nextState[action.payload.items.id] = action.payload.items[]
    //   return action.payload.items[id];
    default:
      return state;
  }
};
