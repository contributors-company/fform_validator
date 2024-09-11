# fform_validator

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Example](#example)
    - [Methods](#methods)
    - [Example of Validating a Credit Card](#example-of-validating-a-credit-card)
    - [Example of Validating an IP Address](#example-of-validating-an-ip-address)
    - [Recommendation for use with the `fform` package](#recommendation-for-use-with-the-fform-package)
    - [Example of a Custom Password Field](#example-of-a-custom-password-field)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

`FFormValidator` is a simple and lightweight Dart package for validating form inputs such as emails, URLs, IP addresses, credit card numbers, and more. It provides convenient validation methods to ensure your form data meets specific criteria without writing complex validation logic from scratch.

## Features

- Validate if a string is non-empty (`isRequired`).
- Validate if a string is a valid email (`isEmail`).
- Validate if a string is a valid URL (`isUrl`).
- Validate if a string has a minimum or maximum length.
- Validate if a string is a valid IP address or IPv6 address.
- Validate if a string contains only numeric characters.
- Validate if a string is all lowercase or uppercase.
- Validate if a string contains special characters.
- Validate if a string is a valid credit card number (with optional formatting).

## Installation

run the following command:

```bash
flutter pub add fform_validator

```

## Usage

To use the `FFormValidator` class, simply create an instance with the string you want to validate and call the appropriate validation methods.

### Example

```dart
import 'package:fform_validator/fform_validator.dart';

void main() {
  final validator = FFormValidator('hello');

  print(validator.isRequired); // true
  print(validator.isEmail); // false

  final emailValidator = FFormValidator('test@example.com');
  print(emailValidator.isEmail); // true

  final urlValidator = FFormValidator('https://www.example.com');
  print(urlValidator.isUrl); // true
}
```

### Methods

| Method                                    | Description                                                                          |
|-------------------------------------------|--------------------------------------------------------------------------------------|
| `bool get isRequired`                     | Returns `true` if the string is non-empty.                                           |
| `bool get isEmail`                        | Returns `true` if the string is a valid email address.                               |
| `bool get isUrl`                          | Returns `true` if the string is a valid URL.                                         |
| `bool isMinLength(int length)`            | Returns `true` if the string is at least `length` characters long.                   |
| `bool isMaxLength(int length)`            | Returns `true` if the string is at most `length` characters long.                    |
| `bool isLength(int length)`               | Returns `true` if the string is exactly `length` characters long.                    |
| `bool get isIp`                           | Returns `true` if the string is a valid IPv4 address.                                |
| `bool get isIpv6`                         | Returns `true` if the string is a valid IPv6 address.                                |
| `bool get isNumber`                       | Returns `true` if the string contains only numeric characters.                       |
| `bool get isHaveNumber`                   | Returns `true` if the string have numeric characters.                                |
| `bool get isFloat`                        | Returns `true` if the string contains only numeric characters. not required with dot |
| `bool get isHaveFloat`                    | Returns `true` if the string have numeric characters. not required with dot          |
| `bool get isLowercase`                    | Returns `true` if the string is in lowercase.                                        |
| `bool get isUppercase`                    | Returns `true` if the string is in uppercase.                                        |
| `bool get isHaveSpecialChar`              | Returns `true` if the string contains any special characters.                        |
| `bool isCreditCard({String space = ' '})` | Returns `true` if the string is a valid credit card number. Can handle spaces.       |

### Example of Validating a Credit Card

```dart
final cardValidator = FFormValidator('1234 5678 1234 5678');
print(cardValidator.isCreditCard()); // true
```

### Example of Validating an IP Address

```dart
final ipValidator = FFormValidator('192.168.1.1');
print(ipValidator.isIp); // true

final ipv6Validator = FFormValidator('2001:0db8:85a3:0000:0000:8a2e:0370:7334');
print(ipv6Validator.isIpv6); // true
```

# [fform](https://pub.dev/packages/fform)

## Recommendation for use with the `fform` package

To create custom input fields with flexible validation, it is recommended to use the `fform` package in combination with your own validator, such as `fform_validator`. This allows you to check if a password field value meets requirements such as minimum length, special characters, and numbers, with detailed error output.

### Example of a Custom Password Field

```dart

import 'package:fform/fform.dart';
import 'package:fform_validator/fform_validator.dart';

class PasswordValidationException extends FFormException {
  final bool isMinLengthValid;
  final bool isSpecialCharValid;
  final bool isNumberValid;

  PasswordValidationException({
    required this.isMinLengthValid,
    required this.isSpecialCharValid,
    required this.isNumberValid,
  });
  
  bool get isValid => isMinLengthValid && isSpecialCharValid && isNumberValid;
}

class PasswordField extends FFormField<String, PasswordValidationException> {
  PasswordField(String value) : super(value);

  @override
  PasswordValidationException? validator(String value) {
    final validator = FFormValidator(value);
    return PasswordValidationException(
      isMinLengthValid: validator.isMinLength(8),
      isSpecialCharValid: validator.isHaveSpecialChar,
      isNumberValid: validator.isHaveNumber,
    );
  }
}

```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue on GitHub if you find bugs or have feature suggestions.

1. Fork the repository.
2. Create a new branch.
3. Make your changes and commit.
4. Push the branch to your fork and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, feel free to reach out via GitHub issues.