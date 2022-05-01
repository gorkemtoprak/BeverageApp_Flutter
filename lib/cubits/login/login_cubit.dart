import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:equatable/equatable.dart';

import '../../core/enums/login_status.dart';
import '../../core/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginRegisterStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginRegisterStatus.initial));
  }

  Future<void> logInWithCredentials() async {
    if (state.status == LoginRegisterStatus.submitting) return;
    emit(state.copyWith(status: LoginRegisterStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginRegisterStatus.success));
    } catch (_) {}
  }
}
