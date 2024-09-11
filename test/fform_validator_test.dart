import 'package:fform_validator/fform_validator.dart';
import 'package:test/test.dart';

void main() {
  group('FFormValidator', () {
    test('isRequired returns true for non-empty value', () {
      final validator = FFormValidator('hello');
      expect(validator.isRequired, isTrue);
    });

    test('isRequired returns false for empty value', () {
      final validator = FFormValidator('');
      expect(validator.isRequired, isFalse);
    });

    test('isEmail returns true for valid email', () {
      final validator = FFormValidator('test@example.com');
      expect(validator.isEmail, isTrue);
    });

    test('isEmail returns false for invalid email', () {
      final validator = FFormValidator('invalid-email');
      expect(validator.isEmail, isFalse);
    });

    test('isUrl returns true for valid URL', () {
      final validator = FFormValidator('https://www.example.com');
      expect(validator.isUrl, isTrue);
    });

    test('isUrl returns false for invalid URL', () {
      final validator = FFormValidator('invalid-url');
      expect(validator.isUrl, isFalse);
    });

    test('isMinLength returns true for string longer than min length', () {
      final validator = FFormValidator('hello');
      expect(validator.isMinLength(3), isTrue);
    });

    test('isMinLength returns false for string shorter than min length', () {
      final validator = FFormValidator('hi');
      expect(validator.isMinLength(3), isFalse);
    });

    test('isMaxLength returns true for string shorter than max length', () {
      final validator = FFormValidator('hi');
      expect(validator.isMaxLength(5), isTrue);
    });

    test('isMaxLength returns false for string longer than max length', () {
      final validator = FFormValidator('hello world');
      expect(validator.isMaxLength(5), isFalse);
    });

    test('isLength returns true for string with exact length', () {
      final validator = FFormValidator('hello');
      expect(validator.isLength(5), isTrue);
    });

    test('isLength returns false for string with different length', () {
      final validator = FFormValidator('hello');
      expect(validator.isLength(3), isFalse);
    });

    test('isIp returns true for valid IP address', () {
      final validator = FFormValidator('192.168.1.1');
      expect(validator.isIp, isTrue);
    });

    test('isIp returns false for invalid IP address', () {
      final validator = FFormValidator('aaa.aaa.999.999');
      expect(validator.isIp, isFalse);
    });

    test('isIpv6 returns true for valid IPv6 address', () {
      final validator =
          FFormValidator('2001:0db8:85a3:0000:0000:8a2e:0370:7334');
      expect(validator.isIpv6, isTrue);
    });

    test('isIpv6 returns false for invalid IPv6 address', () {
      final validator = FFormValidator('invalid-ipv6');
      expect(validator.isIpv6, isFalse);
    });

    test('isNumeric returns true for numeric value', () {
      final validator = FFormValidator('12345');
      expect(validator.isNumber, isTrue);
    });

    test('isNumeric returns false for non-numeric value', () {
      final validator = FFormValidator('abc123');
      expect(validator.isNumber, isFalse);
    });

    test('isLowercase returns true for lowercase string', () {
      final validator = FFormValidator('hello');
      expect(validator.isLowercase, isTrue);
    });

    test('isLowercase returns false for string with uppercase letters', () {
      final validator = FFormValidator('Hello');
      expect(validator.isLowercase, isFalse);
    });

    test('isUppercase returns true for uppercase string', () {
      final validator = FFormValidator('HELLO');
      expect(validator.isUppercase, isTrue);
    });

    test('isUppercase returns false for string with lowercase letters', () {
      final validator = FFormValidator('Hello');
      expect(validator.isUppercase, isFalse);
    });

    test('isHaveSpecialChar returns true for string with special character',
        () {
      final validator = FFormValidator('hello!');
      expect(validator.isHaveSpecialChar, isTrue);
    });

    test('isHaveSpecialChar returns false for string without special character',
        () {
      final validator = FFormValidator('hello');
      expect(validator.isHaveSpecialChar, isFalse);
    });

    test('isCreditCard returns true for valid credit card number with spaces',
        () {
      final validator = FFormValidator('1234 5678 1234 5678');
      expect(validator.isCreditCard(), isTrue);
    });

    test('isCreditCard returns false for invalid credit card number', () {
      final validator = FFormValidator('invalid-card-number');
      expect(validator.isCreditCard(), isFalse);
    });
  });
}
