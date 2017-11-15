import React from 'react';
import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { receiveTodo, fetchTodos, createTodo, removeTodo }
from "../../actions/todo_actions.js";

const MapStateToProps = ( state ) => ({
  todos: allTodos(state)
});

const MapDispatchToProps = ( dispatch ) => ({
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  createTodo: (todo) => dispatch(createTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos())
});

export default connect(MapStateToProps, MapDispatchToProps)(TodoList);
