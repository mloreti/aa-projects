import { RECEIVE_POKEMON_ERRORS } from '../actions/pokemon_action';
import merge from 'lodash/merge';

const ErrorsReducer = (state = {responseText:[]}, action) => {
  Object.freeze(state);
  let newState = {};

  switch(action.type) {
    case RECEIVE_POKEMON_ERRORS:
      let dup = merge({}, state);
      dup.responseText= JSON.parse(action.errors.responseText);
      return dup;
    default:
      return state;
  }
};


export default ErrorsReducer;
