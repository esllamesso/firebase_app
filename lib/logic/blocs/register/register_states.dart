import 'package:equatable/equatable.dart';

abstract class RegisterStates extends Equatable{
  const RegisterStates();
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterStates{}
class RegisterLoading extends RegisterStates{}
class RegisterSuccess extends RegisterStates{}
class RegisterError extends RegisterStates{
  final String message;
  const RegisterError(this.message);
  @override
  List<Object?> get props => [message];
}