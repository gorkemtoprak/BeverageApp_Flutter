import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_full/cubits/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/register_text_field_widget.dart';

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
                RegisterTextFieldWidget(
                  labelText: 'Email',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(email: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                RegisterTextFieldWidget(
                  labelText: 'Full Name',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(fullName: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                RegisterTextFieldWidget(
                  labelText: 'Country',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(country: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                RegisterTextFieldWidget(
                  labelText: 'City',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(city: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                RegisterTextFieldWidget(
                  labelText: 'Address',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(address: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                RegisterTextFieldWidget(
                  labelText: 'ZIP Code',
                  onChanged: (value) {
                    context.read<RegisterCubit>().userChanged(
                          state.user!.copyWith(zipCode: value),
                        );
                  },
                ),
                const SizedBox(height: 10),
                RegisterTextFieldWidget(
                  labelText: 'Password',
                  obscureText: true,
                  onChanged: (password) {
                    context.read<RegisterCubit>().passwordChanged(password);
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    context.read<RegisterCubit>().signUpWithCredentials();
                    await AutoRouter.of(context).pushNamed('/login');
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
