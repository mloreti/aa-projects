import { combineReducers } from 'redux';
import PokemonReducer from './pokemon_reducer';
import PokemonDetailReducer from './pokemon_detail_reducer';
import ErrorsReducer from './errors_reducer';
import LoadingReducer from './loading_reducer';

const RootReducer = combineReducers({
  pokemon: PokemonReducer,
  pokemonDetail: PokemonDetailReducer,
  errors: ErrorsReducer,
  loading: LoadingReducer
});

export default RootReducer;
