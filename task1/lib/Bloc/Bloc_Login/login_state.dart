part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  String? get token => null;
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  @override
  final String token;
  LoginSuccess(this.token);
  String get tn => token;
}

class LoginFailure extends LoginState {}
