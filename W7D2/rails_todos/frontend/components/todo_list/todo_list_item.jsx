import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selected: false
    };
  }

  render() {
    if (this.state.selected) {
      return (
        <li>
          <h3 onClick={ () => this.setState({selected: false}) }>{this.props.todo.title}</h3>
          <h4>{this.props.todo.body}</h4>
          <button onClick={ () => this.props.delete(this.props.todo) }>Delete Item</button>
        </li>
      );
    } else {
      return (
        <li onClick={ () => this.setState({selected: true}) }>
          {this.props.todo.title}</li>
      );
    }
  }
}

export default TodoListItem;
