part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {

  HomeInitial();

  @override
  List<Object?> get props => [];
}

class SuccessLoginState extends HomeState{
  final String username;

  SuccessLoginState(this.username);

  @override
  List<Object?> get props => [username];

}

class RegisteringServiceState extends HomeState{

  @override
  List<Object?> get props => [];

}
