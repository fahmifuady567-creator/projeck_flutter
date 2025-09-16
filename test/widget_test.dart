import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_register_app/login_page.dart';

void main() {
  testWidgets('LoginPage renders email & password fields',
      (WidgetTester tester) async {
    
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    
    expect(find.byType(TextField), findsNWidgets(2));
    
    expect(find.text('Login'), findsOneWidget);
  });
}
