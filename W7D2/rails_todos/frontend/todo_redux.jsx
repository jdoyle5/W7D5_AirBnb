import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveTodo, receiveTodos, fetchTodos } from './actions/todo_actions';
import Root from "./components/root";
import allTodos from './reducers/selectors';
import { GetApiTodos } from './util/todo_api_util';
import { receiveErrors } from './actions/error_actions';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('content');
  const store = configureStore();
  ReactDOM.render( <Root store={ store } />, rootEl);
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;
  window.GetApiTodos = GetApiTodos;
  window.fetchTodos = fetchTodos;
  window.receiveErrors = receiveErrors;
});
