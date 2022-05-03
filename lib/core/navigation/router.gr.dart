// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../main_view.dart' as _i1;
import '../../models/category_model.dart' as _i13;
import '../../views/cart/cart_view.dart' as _i9;
import '../../views/category/category_view.dart' as _i4;
import '../../views/checkout/checkout_view.dart' as _i5;
import '../../views/confirm_orders/confirm_orders_view.dart' as _i6;
import '../../views/home/home_view.dart' as _i8;
import '../../views/login/login_view.dart' as _i2;
import '../../views/payment/payment_view.dart' as _i7;
import '../../views/profile/profile_view.dart' as _i10;
import '../../views/register/register_view.dart' as _i3;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    Main.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainView());
    },
    Login.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginView());
    },
    Register.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterView());
    },
    Category.name: (routeData) {
      final args =
          routeData.argsAs<CategoryArgs>(orElse: () => const CategoryArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.CategoryView(
              key: args.key, categoryModel: args.categoryModel));
    },
    Checkout.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CheckoutView());
    },
    Confirm.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ConfirmOrdersView());
    },
    Payment.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.PaymentView());
    },
    Home.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.HomeView());
    },
    Cart.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CartView());
    },
    Profile.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ProfileView());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i11.RouteConfig(Main.name, path: '/main', children: [
          _i11.RouteConfig('#redirect',
              path: '', parent: Main.name, redirectTo: 'home', fullMatch: true),
          _i11.RouteConfig(Home.name, path: 'home', parent: Main.name),
          _i11.RouteConfig(Cart.name, path: 'cart', parent: Main.name),
          _i11.RouteConfig(Profile.name, path: 'profile', parent: Main.name)
        ]),
        _i11.RouteConfig(Login.name, path: '/login'),
        _i11.RouteConfig(Register.name, path: '/register'),
        _i11.RouteConfig(Category.name, path: '/category'),
        _i11.RouteConfig(Checkout.name, path: '/checkout'),
        _i11.RouteConfig(Confirm.name, path: '/confirm'),
        _i11.RouteConfig(Payment.name, path: '/payment')
      ];
}

/// generated route for
/// [_i1.MainView]
class Main extends _i11.PageRouteInfo<void> {
  const Main({List<_i11.PageRouteInfo>? children})
      : super(Main.name, path: '/main', initialChildren: children);

  static const String name = 'Main';
}

/// generated route for
/// [_i2.LoginView]
class Login extends _i11.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/login');

  static const String name = 'Login';
}

/// generated route for
/// [_i3.RegisterView]
class Register extends _i11.PageRouteInfo<void> {
  const Register() : super(Register.name, path: '/register');

  static const String name = 'Register';
}

/// generated route for
/// [_i4.CategoryView]
class Category extends _i11.PageRouteInfo<CategoryArgs> {
  Category({_i12.Key? key, _i13.CategoryModel? categoryModel})
      : super(Category.name,
            path: '/category',
            args: CategoryArgs(key: key, categoryModel: categoryModel));

  static const String name = 'Category';
}

class CategoryArgs {
  const CategoryArgs({this.key, this.categoryModel});

  final _i12.Key? key;

  final _i13.CategoryModel? categoryModel;

  @override
  String toString() {
    return 'CategoryArgs{key: $key, categoryModel: $categoryModel}';
  }
}

/// generated route for
/// [_i5.CheckoutView]
class Checkout extends _i11.PageRouteInfo<void> {
  const Checkout() : super(Checkout.name, path: '/checkout');

  static const String name = 'Checkout';
}

/// generated route for
/// [_i6.ConfirmOrdersView]
class Confirm extends _i11.PageRouteInfo<void> {
  const Confirm() : super(Confirm.name, path: '/confirm');

  static const String name = 'Confirm';
}

/// generated route for
/// [_i7.PaymentView]
class Payment extends _i11.PageRouteInfo<void> {
  const Payment() : super(Payment.name, path: '/payment');

  static const String name = 'Payment';
}

/// generated route for
/// [_i8.HomeView]
class Home extends _i11.PageRouteInfo<void> {
  const Home() : super(Home.name, path: 'home');

  static const String name = 'Home';
}

/// generated route for
/// [_i9.CartView]
class Cart extends _i11.PageRouteInfo<void> {
  const Cart() : super(Cart.name, path: 'cart');

  static const String name = 'Cart';
}

/// generated route for
/// [_i10.ProfileView]
class Profile extends _i11.PageRouteInfo<void> {
  const Profile() : super(Profile.name, path: 'profile');

  static const String name = 'Profile';
}
