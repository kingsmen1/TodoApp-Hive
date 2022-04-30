import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivetodo/services/todo.dart';
import 'package:hivetodo/todos/bloc/todos_bloc.dart';

class TodosPage extends StatelessWidget {
  TodosPage({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: BlocProvider(
        create: (context) =>
            TodosBloc(RepositoryProvider.of<TodoServices>(context))
              ..add(LoadTodosEvent(username)),
        child: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is TodosLoadedState) {
              return ListView(
                children: state.task
                    .map((e) => ListTile(
                          title: Text(e.task),
                          trailing: Checkbox(
                            value: e.completed,
                            onChanged: (value) {},
                          ),
                        ))
                    .toList(),
              );
            }
            return Container();
          },
        ),
      ),
    ));
  }
}
