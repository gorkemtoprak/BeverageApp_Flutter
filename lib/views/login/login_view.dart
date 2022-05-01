import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/login/login_cubit.dart';
import 'widgets/email_input_widget.dart';
import 'widgets/password_input_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome to Toprak Commerce',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          bottom: 120,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EmailInput(),
            const SizedBox(height: 10),
            const PasswordInput(),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().logInWithCredentials();
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                primary: Colors.black,
                fixedSize: const Size(200, 40),
              ),
              child: Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
