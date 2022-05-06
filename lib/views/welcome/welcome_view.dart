import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: 20,
        ),
        child: Center(
          child: Column(
            children: [
              LottieBuilder.network(
                'https://assets10.lottiefiles.com/temp/lf20_fw4v8s.json',
                width: double.infinity,
                height: 300,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await AutoRouter.of(context).pushNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  primary: Colors.black,
                  fixedSize: const Size(200, 40),
                ),
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await AutoRouter.of(context).pushNamed('/register');
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  primary: Colors.white,
                  fixedSize: const Size(200, 40),
                ),
                child: Text(
                  'Register',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
