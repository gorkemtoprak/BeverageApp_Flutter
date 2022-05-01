import 'package:e_commerce_full/cubits/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    Key? key,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  final Function(String)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(labelText: labelText),
        );
      },
    );
  }
}
