import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_full/main_view.dart';
import 'package:e_commerce_full/views/category/category_view.dart';
import 'package:e_commerce_full/views/checkout/checkout_view.dart';
import 'package:e_commerce_full/views/confirm_orders/confirm_orders_view.dart';
import 'package:e_commerce_full/views/payment/payment_view.dart';

import '../../views/cart/cart_view.dart';
import '../../views/home/home_view.dart';
import '../../views/login/login_view.dart';
import '../../views/profile/profile_view.dart';
import '../../views/register/register_view.dart';

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
        AutoRoute(
          page: LoginView,
          name: 'login',
          path: 'login',
        ),
        AutoRoute(
          page: RegisterView,
          name: 'register',
          path: 'register',
        ),
        AutoRoute(
          page: CategoryView,
          name: 'category',
          path: 'category',
        ),
        AutoRoute(
          page: CheckoutView,
          name: 'checkout',
          path: 'checkout',
        ),
        AutoRoute(
          page: ConfirmOrdersView,
          name: 'confirm',
          path: 'confirm',
        ),
        AutoRoute(
          page: PaymentView,
          name: 'payment',
          path: 'payment',
        ),
      ],
    ),
  ],
)
class $AppRouter {}
