import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_e1pmabgl.json',
              height: 150,
              width: 150,
            ),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
