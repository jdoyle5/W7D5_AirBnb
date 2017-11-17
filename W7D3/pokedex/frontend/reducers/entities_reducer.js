import { combineReducers } from 'redux';
import { pokemonReducer } from './pokemon_reducer';
import { itemsReducer } from './items_reducer';

export const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemsReducer
});
