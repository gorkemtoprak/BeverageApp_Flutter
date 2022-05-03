import 'package:e_commerce_full/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_full/blocs/category/category_bloc.dart';
import 'package:e_commerce_full/blocs/payment/payment_bloc.dart';
import 'package:e_commerce_full/blocs/product/product_bloc.dart';
import 'package:e_commerce_full/blocs/profile/profile_bloc.dart';
import 'package:e_commerce_full/core/repository/auth_repository.dart';
import 'package:e_commerce_full/core/repository/user_repository.dart';
import 'package:e_commerce_full/core/theme/app_theme.dart';
import 'package:e_commerce_full/viewmodels/category_view_model.dart';
import 'package:e_commerce_full/viewmodels/checkout_view_model.dart';
import 'package:e_commerce_full/viewmodels/product_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/checkout/checkout_bloc.dart';
import 'core/navigation/router.gr.dart';
import 'cubits/login/login_cubit.dart';
import 'cubits/register/register_cubit.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            userRepository: context.read<UserRepository>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
          BlocProvider(create: (_) => PaymentBloc()..add(LoadPaymentMethod())),
          BlocProvider(
            create: (_) => CategoryBloc(categoryRepository: CategoryViewModel())
              ..add(LoadCategories()),
          ),
          BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductViewModel())
              ..add(LoadProducts()),
          ),
          BlocProvider(
            create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              paymentBloc: context.read<PaymentBloc>(),
              checkoutRepository: CheckOutViewModel(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: context.read<UserRepository>(),
            )..add(LoadProfile(context.read<AuthBloc>().state.authUser)),
          ),
        ],
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          title: 'Toprak Commerce',
          debugShowCheckedModeBanner: false,
          theme: theme(),
        ),
      ),
    );
  }
}
