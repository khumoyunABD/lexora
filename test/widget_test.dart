import 'package:flutter_test/flutter_test.dart';

import 'package:lexora/main.dart';

void main() {
  testWidgets('Lexora app loads login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LexoraApp());

    // Verify that the login screen is displayed
    expect(find.text('Log in or sign up'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}
