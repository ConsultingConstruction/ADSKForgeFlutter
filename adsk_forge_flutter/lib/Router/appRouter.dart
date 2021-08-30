import 'package:adsk_forge_flutter/views/views.dart';
import 'package:auto_route/annotations.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(path: '/login', page: LoginView, initial: true),
    AutoRoute(path: '/register', page: RegisterView),
    AutoRoute(path: '/hubs', page: HubsView),
    AutoRoute(path: '/account', page: AccountView),
  ],
)
class $AppRouter {}
