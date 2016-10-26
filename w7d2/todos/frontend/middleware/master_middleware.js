import { applyMiddleware } from 'redux';
import todosMiddleware from './todo_middleware';

const masterMiddleware = applyMiddleware(
  todosMiddleware
);

export default masterMiddleware;
