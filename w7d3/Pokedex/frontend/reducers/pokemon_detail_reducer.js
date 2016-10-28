import { RECEIVE_POKEMON } from '../actions/pokemon_action';
import merge from 'lodash/merge';

const _defaultPokemon = {
  name: "",
  defense: "",
  attack: "",
  moves: [],
  items: ["", "", ""],
  poke_type: ""
};


const PokemonDetailReducer = (state = _defaultPokemon, action) => {
  Object.freeze(state);
  let newState = {};
  switch(action.type) {
    case RECEIVE_POKEMON:
      let newPokemon = action.pokemon;
      newState = merge({}, state, newPokemon);
      return newState;
    default:
      return state;
  }
};


export default PokemonDetailReducer;
