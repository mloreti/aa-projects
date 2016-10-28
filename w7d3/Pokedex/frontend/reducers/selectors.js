import values from 'lodash/values';

export const selectAllPokemon = ({pokemon}) => values(pokemon);

export const selectPokemonItem = (state, itemId) => (
  state.pokemonDetail.items[itemId]
);

export const selectAllErrors = (state) => (
  state.errors.responseText
);
