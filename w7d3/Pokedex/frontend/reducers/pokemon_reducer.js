import { RECEIVE_ALL_POKEMON, RECEIVE_NEW_POKEMON } from '../actions/pokemon_action';
import merge from 'lodash/merge';

const PokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      let newState = {};
      Object.keys(action.pokemon).forEach(id => {
        newState[id] = action.pokemon[id];
      });
      return newState;
    case RECEIVE_NEW_POKEMON:
      let newPokemon = action.pokemon;
      let dup = merge({}, state);
      dup[newPokemon.id] = newPokemon;
      return dup;
    default:
      return state;
  }
};


export default PokemonReducer;
