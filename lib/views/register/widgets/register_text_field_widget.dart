import 'package:e_commerce_full/cubits/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterTextFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final String? labelText;
  final bool obscureText;
  const RegisterTextFieldWidget({
    Key? key,
    this.onChanged,
    this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
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
