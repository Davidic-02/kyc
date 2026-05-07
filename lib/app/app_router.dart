import 'package:flutter/material.dart';

import '../core/router/route_names.dart';
import '../features/dashboard/presentation/dashboard_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute<void>(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );
    }
  }
}
