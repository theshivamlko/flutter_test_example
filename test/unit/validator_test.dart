import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/validator.dart';

void main() {
  group("validate email ", () {
    test('validate empty email', () {
      // Arrange and Act
      var res = Validator().validateEmail("");

      // Assert
      expect(res, "Email is required");
    });
    test('validate invalid email', () {
      // Arrange and Act
      var res = Validator().validateEmail("abcgmail.com");

      // Assert
      expect(res, "Invalid email");
    });
    test('validate valid email', () {
      // Arrange and Act
      var res = Validator().validateEmail("abc@gmail.com");

      // Assert
      expect(res, null);
    });
    test('validate empty password', () {
      // Arrange and Act
      var res = Validator().validatePassword("");

      // Assert
      expect(res, "Password is required");
    });
    test('validate invalid password', () {
      // Arrange and Act
      var res = Validator().validatePassword("12345");

      // Assert
      expect(res, "Password must be at least 6 characters");
    });
    test('validate valid password', () {
      // Arrange and Act
      var res = Validator().validatePassword("123456");

      // Assert
      expect(res, null);
    });
  });
}
