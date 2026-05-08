import 'package:flutter/material.dart';
import 'package:kyc/app/app_router.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/dark_theme.dart';
import '../core/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
