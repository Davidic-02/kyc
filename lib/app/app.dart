import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';
import '../core/router/route_names.dart';
import '../core/theme/dark_theme.dart';
import '../core/theme/light_theme.dart';
import '../features/dashboard/presentation/dashboard_page.dart';
import 'app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RouteNames.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const DashboardPage(),
    );
  }
}
