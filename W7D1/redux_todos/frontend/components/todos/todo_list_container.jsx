import React from 'react';
import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { receiveTodo } from "../../actions/todo_actions.js";

const MapStateToProps = ( state ) => ({
  todos: allTodos(state)
});

const MapDispatchToProps = ( dispatch ) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

export default connect(MapStateToProps, MapDispatchToProps)(TodoList);
