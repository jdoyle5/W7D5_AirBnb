import merge from 'lodash/merge';
import {
  RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO, receiveTodos, receiveTodo,
  removeTodo
} from "../actions/todo_actions.js";

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = {};
  switch(action.type){
    case RECEIVE_TODOS:
      action.todos.forEach((todo) => {
        newState[todo.id] = todo;
      });
      return newState;
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return merge({}, state, newState);
    case REMOVE_TODO:
      Object.keys(state).forEach((key) => {
        if (state[key].id !== action.todo.id) {
          newState[key] = state[key];
        }
      });
      return newState;
    default:
      return state;
  }
};

export default todosReducer;