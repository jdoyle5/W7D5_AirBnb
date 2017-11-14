import React from 'react';
import { uniqueId } from "../../util/util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    console.log(this.props);
    this.state = {
      id: uniqueId(),
      title: '',
      body: '',
      done: false
    };
  }

  updateState(key) {
    return (event) => (
      this.setState( {[key]: event.target.value} )
    );
     // this.setState( {[key]: event.target.value} )
  }

  submit(event) {
    event.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({ id: uniqueId(), title: "", body: "" });
  }

  render() {
    return (
      <div>
        <form>
        <label htmlFor="form-title-input">title</label>
        <input id="form-title-input"
          onChange={this.updateState("title")} type="text"
          value={this.state.title}/>
        <br />

        <label htmlFor="form-body-input">body</label>
        <input id="form-body-input"
          onChange={this.updateState("body")} type="text"
          value={this.state.body}/>

        <br />
        <button onClick={this.submit.bind(this)}>Add Item</button>
        </form>
      </div>
    );
  }
}

export default TodoForm;
