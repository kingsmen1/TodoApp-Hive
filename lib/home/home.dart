import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivetodo/home/bloc/home_bloc.dart';
import 'package:hivetodo/services/authentication.dart';
import 'package:hivetodo/services/todo.dart';
import 'package:hivetodo/todos/todos.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController userNameField = TextEditingController();
  TextEditingController passwordNameField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to TodoApp'),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
            RepositoryProvider.of<AuthenticationService>(context),
            RepositoryProvider.of<TodoServices>(context))
          ..add(RegisterServiceEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessLoginState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TodosPage(username: state.username)));
            }
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'UserName'),
                    controller: userNameField,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    controller: passwordNameField,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(LoginEvent(
                            userNameField.text, passwordNameField.text));
                      },
                      child: const Text("Login"))
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
