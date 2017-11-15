
const allTodos = (state) => {
  const keys = Object.keys(state.todos);
  const todoArray = keys.map((key) => (
    state.todos[key]
  ));
  return todoArray;
};

export default allTodos;
