// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:adsk_forge_flutter/views/views.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginViewRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.LoginView();
        }),
    RegisterViewRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.RegisterView();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i1.RouteConfig(LoginViewRoute.name, path: '/login'),
        _i1.RouteConfig(RegisterViewRoute.name, path: '/register')
      ];
}

class LoginViewRoute extends _i1.PageRouteInfo {
  const LoginViewRoute() : super(name, path: '/login');

  static const String name = 'LoginViewRoute';
}

class RegisterViewRoute extends _i1.PageRouteInfo {
  const RegisterViewRoute() : super(name, path: '/register');

  static const String name = 'RegisterViewRoute';
}
