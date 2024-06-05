import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/login_screen.dart';

main() {
  testWidgets("Should have title", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Act
    Finder title = find.text("Login");

    // Assert
    expect(title, findsAny);
  });

  testWidgets("Should have field for email", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Act
    Finder email = find.byKey(ValueKey("emailId"));

    // Assert
    expect(email, findsOneWidget);
  });
  testWidgets("Should have field for password", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Act
    Finder pass = find.byKey(ValueKey("password"));

    // Assert
    expect(pass, findsOneWidget);
  });
  testWidgets("Should have login button", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Act
    Finder btn = find.byType(ElevatedButton);

    // Assert
    expect(btn, findsOneWidget);
  });

  testWidgets("Show Error if email  empty", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Act
    Finder btn = find.byType(ElevatedButton);
    await tester.tap(btn);
    // Wait for the widget to rebuild or animation then write u test case
    await tester.pumpAndSettle();

    Finder errorText = find.text("Email is required");

    // Assert
    expect(errorText, findsNWidgets(1));
  });

  testWidgets("Show Error if pass empty", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Act
    Finder btn = find.byType(ElevatedButton);
    await tester.tap(btn);
    // Wait for the widget to rebuild or animation then write u test case
    await tester.pumpAndSettle();

    Finder errorText = find.text("Password is required");

    // Assert
    expect(errorText, findsNWidgets(1));
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
}
