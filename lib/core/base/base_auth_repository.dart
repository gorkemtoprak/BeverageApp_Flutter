import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../models/user_model.dart';

abstract class BaseAuthRepository {
  Stream<auth.User?> get user;

  Future<auth.User?> signUp({
    required UserModel user,
    required String password,
  });

  Future<void> logInWithGoogle();

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
