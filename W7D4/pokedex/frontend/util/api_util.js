export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/pokemon/index'
  });
};

export const fetchOnePokemon = id => {
  return $.ajax({
    method: 'GET',
    url: `/api/pokemon/${id}`
  });
};

export const createNewPokemon = poke => {
  return $.ajax({
      method: 'POST',
      url: '/api/pokemon'
  });
};

// export const fetchOneItem = (pokeId, itemId) => {
//   return $.ajax({
//     method: 'GET',
//     url: `/api/pokemon/${pokeId}/item/${itemId}`
//   });
// };
