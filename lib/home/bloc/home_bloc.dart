import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hivetodo/services/authentication.dart';
import 'package:hivetodo/services/todo.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationService _auth;
  final TodoServices _todo;

  HomeBloc(this._auth, this._todo) : super(RegisteringServiceState()) {
    on<LoginEvent>((event, emit) async {
      final user = await _auth.authenticateUser(event.username, event.password);
      if (user != null) {
        emit(SuccessLoginState(user));
        emit(HomeInitial());
      }
    });

    on<RegisterServiceEvent>((event, emit) async {
      await _auth.init();
      await _todo.init();
      emit(HomeInitial());
    });
  }
}
