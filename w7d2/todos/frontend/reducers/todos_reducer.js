import { RECEIVE_TODOS, CREATE_TODO, RECEIVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';


const TodosReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      let newState = {};
      action.todos.forEach(todo => newState[todo.id] = todo);
      return newState;
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      newState = merge({}, state, newTodo);
      return newState;
    default:
      return state;
  }
};


export default TodosReducer;
