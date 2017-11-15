export const APIFetchTodos = () => (
  $.ajax({
    method: "GET",
    url: "api/todos"
  })
);

export const APICreateTodo = (todo) => (
  $.ajax({
    method: "POST",
    url: "api/todos",
    data: {todos: todo}
  })
);
