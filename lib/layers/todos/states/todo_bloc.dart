import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/layers/todos/states/todo_event.dart';
import 'package:flutter_lessons/layers/todos/states/todo_state.dart';
import '../todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc(this.repository) : super(TodoInitial()) {
    on<LoadTodos>(_loadTodos);
  }

  Future<void> _loadTodos(
      LoadTodos event,
      Emitter<TodoState> emit
      ) async {
    emit(TodoLoading());

    try {
      final todos = await repository.getTodos();

      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}