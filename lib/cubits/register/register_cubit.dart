import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:e_commerce_full/models/user_model.dart';
import 'package:equatable/equatable.dart';

import '../../core/enums/login_status.dart';
import '../../core/repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterState.initial());

  void userChanged(UserModel user) {
    emit(state.copyWith(
      user: user,
      status: LoginRegisterStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginRegisterStatus.initial));
  }

  Future<void> signUpWithCredentials() async {
    if (!state.isFormValid || state.status == LoginRegisterStatus.submitting) {
      return;
    }
    emit(state.copyWith(status: LoginRegisterStatus.submitting));
    try {
      var authUser = await _authRepository.signUp(
        password: state.password,
        user: state.user!,
      );
      emit(state.copyWith(
          status: LoginRegisterStatus.success, authUser: authUser));
    } catch (_) {}
  }
}
