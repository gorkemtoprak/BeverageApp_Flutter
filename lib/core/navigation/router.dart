import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_full/ecommerce/cart/cart_view.dart';
import 'package:e_commerce_full/ecommerce/home/home_view.dart';
import 'package:e_commerce_full/ecommerce/profile/profile_view.dart';
import 'package:e_commerce_full/main_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainView,
      name: 'main',
      path: '/main',
      initial: true,
      children: [
        RedirectRoute(
          path: '',
          redirectTo: 'home',
        ),
        AutoRoute(
          page: HomeView,
          name: 'home',
          path: 'home',
          initial: true,
        ),
        AutoRoute(
          page: CartView,
          name: 'cart',
          path: 'cart',
        ),
        AutoRoute(
          page: ProfileView,
          name: 'profile',
          path: 'profile',
        ),
      ],
    ),
  ],
)
class $AppRouter {}
