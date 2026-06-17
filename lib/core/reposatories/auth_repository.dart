import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register({required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }


}
