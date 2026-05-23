import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_one/login.dart'; // Imports your login page

void main() {
  testWidgets('Shrine Login Page smoke test', (WidgetTester tester) async {
    // 1. Build our LoginPage inside a MaterialApp wrapper and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    // 2. Verify that the 'SHRINE' text widget is present on the screen.
    expect(find.text('SHRINE'), findsOneWidget);

    // 3. Verify that the asset image exists in the widget tree.
    expect(find.byType(Image), findsOneWidget);
    
    // 4. Verify that the counter app text does NOT exist here.
    expect(find.text('0'), findsNothing);
  });
}