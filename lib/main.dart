import 'package:e_commerce_full/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/navigation/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'E-Commerce Full',
      debugShowCheckedModeBanner: false,
      theme: theme(),
    );
  }
}
