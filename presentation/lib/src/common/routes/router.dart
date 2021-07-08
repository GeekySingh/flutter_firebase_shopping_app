import 'package:auto_route/annotations.dart';
import 'package:presentation/src/features/dashboard/dashboard_screen.dart';
import 'package:presentation/src/features/login/login_screen.dart';

export 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: DashboardScreen),
])
class $FeatureRouter {}
