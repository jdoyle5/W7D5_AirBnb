// import values from 'lodash/values';

export const selectAllPokemon = state => {
  //changes shape of data; allows for iterators & auto-renders in React
  // debugger;
  return Object.values(state.entities.pokemon);
};


export const selectOnePokemon = (state, id) => {
  return state.entities.pokemon[id];
};

export const selectItems = (state) => {
  return Object.values(state.entities.items);
};

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId];
};
