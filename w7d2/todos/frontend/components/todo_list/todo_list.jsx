import React from 'react';

class TodoList extends React.Component {

  componentDidMount() {
    this.props.requestTodos();
  }

  render(){
    const todos = this.props.todos;
    return(
      <div className="todos-list">
        {todos.map(todo => {
          return <div key={todo.id} className="todo">
            <h3 className="todo-title">{todo.title}</h3>
            <p className="todo-body">{todo.body}</p>
          </div>;
        })}
      </div>
    );
  }
}

export default TodoList;
