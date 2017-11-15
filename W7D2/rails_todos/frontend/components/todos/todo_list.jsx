import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="todo-list-container">
        <ul>
          {this.props.todos.map((prop) => (
            <TodoListItem key={prop.id} todo={prop} delete={this.props.removeTodo} />
          ))}
        </ul>
        <TodoForm createTodo={this.props.createTodo}/>
      </div>
    );
  }

  componentDidMount() {
    this.props.fetchTodos();
  }
}

export default TodoList;
