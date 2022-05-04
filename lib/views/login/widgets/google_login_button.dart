import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/login/login_cubit.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<LoginCubit>().logInWithGoogle();
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        primary: Colors.white,
        fixedSize: const Size(200, 40),
      ),
      child: Text(
        'Sign In with Google',
        style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }
}
