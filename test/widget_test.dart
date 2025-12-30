import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ResumeApp());

    // Verify that the title text is present.
    expect(find.text('Portfolio'), findsOneWidget);
    
    // Verify that the contact button is present.
    expect(find.text('聯繫我'), findsWidgets);
  });
}
