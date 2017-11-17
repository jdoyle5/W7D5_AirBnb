export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/pokemon/index'
  });
};

export const fetchOnePokemon = poke => {
  return $.ajax({
    method: 'GET',
    url: `/api/pokemon/${poke.id}`
  });
};
