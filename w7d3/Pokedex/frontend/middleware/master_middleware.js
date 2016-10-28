import {applyMiddleware} from 'redux';
import PokemonMiddleware from './pokemon_middleware';

const MasterMiddleware = applyMiddleware(PokemonMiddleware);
export default MasterMiddleware;
