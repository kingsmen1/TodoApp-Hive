
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hivetodo/model/task.dart';
import 'package:hivetodo/services/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final  TodoServices _todoServices;
  TodosBloc(this._todoServices) : super(TodosInitial()) {
    on<LoadTodosEvent>((event, emit) {
      final todos = _todoServices.getTasks(event.username);
      emit(TodosLoadedState(todos));

    });
  }
}
