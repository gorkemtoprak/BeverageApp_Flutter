import 'package:e_commerce_full/cubits/register/register_cubit.dart';
import 'package:e_commerce_full/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/widgets/password_input_widget.dart';
import 'widgets/user_inputs_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserInput(
                  labelText: 'Email',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(email: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                UserInput(
                  labelText: 'Full Name',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(fullName: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                UserInput(
                  labelText: 'Country',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(country: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                UserInput(
                  labelText: 'City',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(city: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                UserInput(
                  labelText: 'Address',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(address: value),
                        );
                  },
                ),
                UserInput(
                  labelText: 'ZIP Code',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(zipCode: value),
                        );
                  },
                ),
                const PasswordInput(),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<RegisterCubit>().signUpWithCredentials();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    primary: Colors.black,
                    fixedSize: const Size(200, 40),
                  ),
                  child: Text(
                    'Register',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
