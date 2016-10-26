import {
  REQUEST_TODOS,
  RECEIVE_TODOS,
  CREATE_TODO,
  RECEIVE_TODO,
  receiveTodos,
  receiveTodo,
  requestTodos
  } from '../actions/todo_actions';
import {
  fetchTodos,
  createTodo
} from '../util/todo_api_util';

const todosMiddleware = ({ getState, dispatch }) => next => action => {
  const success = data => dispatch(receiveTodos(data));
  const createSuccess = data => dispatch(receiveTodo(data));
  const error = e => console.log(e);

  switch (action.type) {
    case REQUEST_TODOS:
      fetchTodos(success, error);
      return next(action);
    case CREATE_TODO:
      createTodo(action.todo, success, error);
      return next(action);
    default:
      return next(action);
  }
};

export default todosMiddleware;
