// This is a basic Flutter widget test.
import 'package:flutter_test/flutter_test.dart';

import 'package:codemaster/app.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CodeMasterApp());

    // Verify that the app loads with the welcome message
    expect(find.text('欢迎来到编程世界！'), findsOneWidget);
  });
}
