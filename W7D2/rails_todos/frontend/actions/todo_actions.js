import { APIFetchTodos, APICreateTodo } from '../util/todo_api_util';
import { receiveErrors } from './error_actions';

export const fetchTodos = () => (dispatch) => {
  APIFetchTodos()
  .then(todos => dispatch(receiveTodos(todos)));
};

export const createTodo = todo => dispatch => (
  APICreateTodo(todo)
    .then(
      responseTodo => dispatch(receiveTodo(responseTodo)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
);

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = (todos) => (
  {
    type: RECEIVE_TODOS,
    todos
  }
);

export const receiveTodo = (todo) => (
  {
    type: RECEIVE_TODO,
    todo
  }
);

export const removeTodo = (todo) => (
  {
    type: REMOVE_TODO,
    todo
  }
);
