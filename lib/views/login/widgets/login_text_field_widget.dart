import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/login/login_cubit.dart';

class LoginTextFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final String? labelText;
  final bool obscureText;
  const LoginTextFieldWidget({
    Key? key,
    this.onChanged,
    this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(labelText: labelText),
          obscureText: obscureText,
        );
      },
    );
  }
}
