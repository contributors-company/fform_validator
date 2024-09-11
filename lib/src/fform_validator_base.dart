/// A class that provides a set of validation methods for form fields.
class FFormValidator {
  final String value;

  FFormValidator(this.value);

  /// Returns true if the value is not empty.
  bool get isRequired => value.isNotEmpty;

  /// Returns true if the value is a valid email.
  bool get isEmail => match(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  /// Returns true if the value is a valid URL.
  bool get isUrl => match(r'^http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$');

  /// Returns true if the value is longer than [length].
  bool isMinLength(int length) => value.length >= length;

  /// Returns true if the value is shorter than [length].
  bool isMaxLength(int length) => value.length <= length;

  /// Returns true if the value has an exact length of [length].
  bool isLength(int length) => value.length == length;

  /// Returns true if the value is a valid IP address.
  bool get isIp => match(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$');

  /// Returns true if the value is a valid IPv6 address.
  bool get isIpv6 => match(r'^([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}$');

  /// Returns true if the value contains only numeric characters.
  bool get isNumber => match(r'^\d+$');

  bool get isHaveNumber => match(r'.*\d.*');

  bool get isFloat => match(r'^-?\d*(\.\d+)?$');

  bool get isHaveFloat => match(r'.*\d+(\.\d+).*');

  /// Returns true if the value is in lowercase.
  bool get isLowercase => value == value.toLowerCase();

  /// Returns true if the value is in uppercase.
  bool get isUppercase => value == value.toUpperCase();

  /// Returns true if the value contains special characters.
  bool get isHaveSpecialChar => match(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');

  /// Returns true if the value matches the [source] pattern.
  bool match(String source) => RegExp(source).hasMatch(value);

  /// Returns true if the value is a valid credit card number.
  bool isCreditCard({String space = ' '}) => match(r'^\d{4}' +
      RegExp.escape(space) +
      r'\d{4}' +
      RegExp.escape(space) +
      r'\d{4}' +
      RegExp.escape(space) +
      r'\d{4}$');
}
