import 'package:equatable/equatable.dart';
import 'package:firebase_app/logic/blocs/register/register_states.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final String email;
  final String password;

 const RegisterButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
