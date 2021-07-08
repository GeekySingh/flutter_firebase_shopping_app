// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../../features/dashboard/dashboard_screen.dart' as _i3;
import '../../features/login/login_screen.dart' as _i2;

class FeatureRouter extends _i1.RootStackRouter {
  FeatureRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginScreenRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.LoginScreen());
    },
    DashboardScreenRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i3.DashboardScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginScreenRoute.name, path: '/'),
        _i1.RouteConfig(DashboardScreenRoute.name, path: '/dashboard-screen')
      ];
}

class LoginScreenRoute extends _i1.PageRouteInfo {
  const LoginScreenRoute() : super(name, path: '/');

  static const String name = 'LoginScreenRoute';
}

class DashboardScreenRoute extends _i1.PageRouteInfo {
  const DashboardScreenRoute() : super(name, path: '/dashboard-screen');

  static const String name = 'DashboardScreenRoute';
}
