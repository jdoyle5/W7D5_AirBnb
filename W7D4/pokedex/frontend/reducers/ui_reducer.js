import { combineReducers } from 'redux';
import { pokeDisplayReducer } from './poke_display_reducer';

export const uiReducer = combineReducers({
  pokeDisplay: pokeDisplayReducer
});
