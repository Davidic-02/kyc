// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:kyc/app/app.dart';
import 'package:kyc/core/constants/app_strings.dart';

void main() {
  testWidgets('App boots into the dashboard scaffold', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const App());

    expect(find.text(AppStrings.homeTitle), findsOneWidget);
    expect(find.text('Feature-first clean architecture scaffold'), findsOneWidget);
  });
}
