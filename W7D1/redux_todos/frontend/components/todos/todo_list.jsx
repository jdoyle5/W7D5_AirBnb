import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

module.exports = (props) => (
  <div>
    <ul>
      {props.todos.map((prop) => (
        <TodoListItem key={prop.id} props={prop} />
      ))}
    </ul>
    <TodoForm receiveTodo={props.receiveTodo}/>
  </div>
);
