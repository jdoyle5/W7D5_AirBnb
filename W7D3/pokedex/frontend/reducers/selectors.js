// import values from 'lodash/values';

export const selectAllPokemon = state => {
  return Object.values(state.entities.pokemon);
};
