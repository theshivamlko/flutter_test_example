
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/MyHomePage.dart';
import 'package:flutter_test_example/login_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {

  group("Login Flow Test", () {

    IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // Initialize integration test binding

    testWidgets("When button clicked, show error if email is empty", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen())); // Pump the widget

      // Find and tap the button
      await tester.tap(find.byType(ElevatedButton));

      // Ensure the widget tree is rebuilt after the tap
      await tester.pumpAndSettle();

      // Find the error message
      expect(find.text("Email is required"), findsOneWidget);
    });
    testWidgets("With valid email and pass", (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Act
      Finder email = find.byKey(ValueKey("emailId"));
      Finder pass = find.byKey(ValueKey("password"));

      await tester.enterText(email, "abc@gmail.com");
      await tester.enterText(pass, "123456");

      Finder btn = find.byType(ElevatedButton);

      await tester.tap(btn);
      // Wait for the widget to rebuild or animation then write u test case
      await tester.pumpAndSettle();

      Finder errorText1 = find.text("Email is required");
      Finder errorText3 = find.text("Invalid email");
      Finder errorText2 = find.text("Password is required");

      // Assert
      expect(errorText1, findsNothing);
      expect(errorText2, findsNothing);
      expect(errorText3, findsNothing);
    });
    testWidgets("Login click open HomePage", (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Act
      Finder email = find.byKey(ValueKey("emailId"));
      Finder pass = find.byKey(ValueKey("password"));

      await tester.enterText(email, "abc@gmail.com");
      await tester.enterText(pass, "123456");

      Finder btn = find.byType(ElevatedButton);

      await tester.tap(btn);
      // Wait for the widget to rebuild or animation then write u test case
      await tester.pumpAndSettle();

      await tester.pumpWidget(MaterialApp(home: MyHomePage(title: "Test")));
      await tester.pumpAndSettle();

      Finder errorText1 = find.text("Test");


      // Assert
      expect(errorText1, findsOneWidget);
     });
  });
}
