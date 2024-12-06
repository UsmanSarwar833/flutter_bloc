

import 'package:bloc/bloc.dart';
import 'package:bloc_taj/bloc/todo/todo_event.dart';
import 'package:bloc_taj/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todo;
  TodoBloc(this.todo) : super(const TodoState()) {
    on<AddEvent>(_add);
    on<RemoveEvent>(_remove);

  }

  void _add(AddEvent event, Emitter<TodoState>emit){
    todo.add(event.task);
    emit(state.copyWith(todoList: List.from(todo)));
  }

  void _remove(RemoveEvent event, Emitter<TodoState>emit){
    todo.remove(event.task);
    emit(state.copyWith(todoList: List.from(todo)));
  }
}
