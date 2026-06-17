import 'package:equatable/equatable.dart';

abstract class LoginStates extends Equatable {
  const LoginStates();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginError extends LoginStates {
  final String message;

  const LoginError(this.message);

  @override
  List<Object?> get props => [message];
}