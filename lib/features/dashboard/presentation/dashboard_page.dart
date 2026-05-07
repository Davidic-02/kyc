import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.homeTitle)),
      body: const Center(
        child: Text('Feature-first clean architecture scaffold'),
      ),
    );
  }
}
