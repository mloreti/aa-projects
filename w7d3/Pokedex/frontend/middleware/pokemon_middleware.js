import {fetchAllPokemon, fetchPokemon, createPokemon} from '../util/api_util';
import { hashHistory} from 'react-router';
import {
  REQUEST_ALL_POKEMON,
  receiveAllPokemon,
  REQUEST_POKEMON,
  receivePokemon,
  CREATE_NEW_POKEMON,
  receiveNewPokemon,
  RECEIVE_POKEMON_ERRORS,
  receivePokemonErrors
} from '../actions/pokemon_action';

const PokemonMiddleware = ({ dispatch }) => next => action => {
  const receiveAllPokemonSuccess = data => dispatch(receiveAllPokemon(data));
  const receivePokemonSuccess = data => dispatch(receivePokemon(data));
  const receivePokemonErrorsSuccess = data => dispatch(receivePokemonErrors(data));
  const receiveNewPokemonSuccess = data => {
    dispatch(receiveNewPokemon(data));
    hashHistory.push(`/pokemon/${data.id}`);
  };

  switch(action.type) {
    case REQUEST_ALL_POKEMON:
      fetchAllPokemon(receiveAllPokemonSuccess);
      return next(action);
    case REQUEST_POKEMON:
      fetchPokemon(action.id, receivePokemonSuccess);
      return next(action);
    case CREATE_NEW_POKEMON:
      createPokemon(action.pokemon, receiveNewPokemonSuccess, receivePokemonErrorsSuccess);
      return next(action);
    case RECEIVE_POKEMON_ERRORS:
      return next(action);
    default:
      return next(action);
    }

};

export default PokemonMiddleware;
