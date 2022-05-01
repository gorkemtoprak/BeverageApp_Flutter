part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String password;
  final LoginRegisterStatus status;
  final auth.User? authUser;
  final UserModel? user;

  bool get isFormValid => user!.email.isNotEmpty && password.isNotEmpty;

  const RegisterState({
    required this.password,
    required this.status,
    this.authUser,
    this.user,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      password: '',
      status: LoginRegisterStatus.initial,
      authUser: null,
      user: UserModel(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [password, status, authUser, user];

  RegisterState copyWith({
    String? password,
    LoginRegisterStatus? status,
    auth.User? authUser,
    UserModel? user,
  }) {
    return RegisterState(
      password: password ?? this.password,
      status: status ?? this.status,
      authUser: authUser ?? this.authUser,
      user: user ?? this.user,
    );
  }
}
