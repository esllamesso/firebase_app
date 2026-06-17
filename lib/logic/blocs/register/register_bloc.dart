import 'package:firebase_app/core/reposatories/auth_repository.dart';
import 'package:firebase_app/logic/blocs/register/register_event.dart';
import 'package:firebase_app/logic/blocs/register/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates>{
  final AuthRepository repository;

  RegisterBloc(this.repository) : super(RegisterInitial()) {
    on<RegisterButtonPressed> (register);
  }
  Future<void> register(
      RegisterButtonPressed event,
      Emitter<RegisterStates> emit,
      ) async {
    emit(RegisterLoading());


    try{
      await repository.register(email: event.email, password: event.password);
      emit(RegisterSuccess());
    }catch(e){
      emit(RegisterError(e.toString()));
    }
  }
}