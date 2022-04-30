part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoadedState extends TodosState{
final List<Task> task;

  TodosLoadedState(this.task);

  @override
  List<Object?> get props => [task];

}