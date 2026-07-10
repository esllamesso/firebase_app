import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/reposatories/auth_repository.dart';
import 'login_event.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  final AuthRepository authService;

  LoginBloc(this.authService) : super(LoginInitial()) {
    on<LoginButtonPressed>(_login);
  }

  Future<void> _login(
    LoginButtonPressed event,
    Emitter<LoginStates> emit,
  ) async {
    print("Start Login");
    emit(LoginLoading());

    try {
      await authService.login(email: event.email, password: event.password);
      print("Firebase Success");
      emit(LoginSuccess());
    } catch (e) {
      print("Firebase Error");
      print(e);
      emit(LoginError(e.toString()));
    }
  }
}


