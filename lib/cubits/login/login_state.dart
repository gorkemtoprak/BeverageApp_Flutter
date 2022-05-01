part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginRegisterStatus status;
  final auth.User? user;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  const LoginState({
    required this.email,
    required this.password,
    required this.status,
    this.user,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      status: LoginRegisterStatus.initial,
      user: null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password, status, user];

  LoginState copyWith({
    String? email,
    String? password,
    LoginRegisterStatus? status,
    auth.User? user,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
