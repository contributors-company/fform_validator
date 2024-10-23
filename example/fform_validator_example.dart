import 'package:fform_validator/fform_validator.dart'; // Assuming this exists

void main() {
  print(FFormValidator('hello')
      .isRequired); // true, because the string is not empty
  print(FFormValidator('').isRequired); // false, because the string is empty

  print(FFormValidator('test@example.com')
      .isEmail); // true, because it is a valid email
  print(FFormValidator('invalid-email')
      .isEmail); // false, because the email is invalid

  print(FFormValidator('https://www.example.com')
      .isUrl); // true, because it is a valid URL
  print(FFormValidator('invalid-url')
      .isUrl); // false, because it is an invalid URL

  print(FFormValidator('hello')
      .isMinLength(3)); // true, the string length is greater than 3
  print(FFormValidator('hi')
      .isMinLength(3)); // false, the string length is less than 3

  print(FFormValidator('hi')
      .isMaxLength(5)); // true, the string length is less than or equal to 5
  print(FFormValidator('hello world')
      .isMaxLength(5)); // false, the string length is greater than 5

  print(FFormValidator('hello')
      .isLength(5)); // true, the string length is exactly 5
  print(FFormValidator('hello')
      .isLength(3)); // false, the string length is not equal to 3

  print(FFormValidator('192.168.1.1').isIp); // true, it is a valid IP
  print(FFormValidator('999.999.999.999').isIp); // false, it is an invalid IP

  print(FFormValidator('2001:0db8:85a3:0000:0000:8a2e:0370:7334')
      .isIpv6); // true, it is a valid IPv6 address
  print(FFormValidator('invalid-ipv6')
      .isIpv6); // false, it is an invalid IPv6 address

  print(FFormValidator('12345')
      .isNumber); // true, the string contains only digits
  print(
      FFormValidator('abc123').isNumber); // false, the string contains letters

  print(FFormValidator('12asd5')
      .isHaveNumber); // true, the string contains digits
  print(FFormValidator('abcasd')
      .isHaveNumber); // false, the string does not contain digits

  print(FFormValidator('12.5').isFloat); // true, the string contains a float
  print(FFormValidator('12').isFloat); // true, the string contains an int

  print(FFormValidator('12asd5')
      .isHaveFloat); // true, the string contains a float
  print(FFormValidator('abcasd')
      .isHaveFloat); // false, the string does not contain a float

  print(
      FFormValidator('hello').isLowercase); // true, the string is in lowercase
  print(FFormValidator('Hello')
      .isLowercase); // false, the string contains uppercase letters

  print(
      FFormValidator('HELLO').isUppercase); // true, the string is in uppercase
  print(FFormValidator('Hello')
      .isUppercase); // false, the string contains lowercase letters

  print(FFormValidator('hello!')
      .isHaveSpecialChar); // true, the string contains a special character
  print(FFormValidator('hello')
      .isHaveSpecialChar); // false, the string does not contain special characters

  print(FFormValidator('1234 5678 1234 5678')
      .isCreditCard()); // true, valid credit card number with spaces
  print(FFormValidator('invalid-card-number')
      .isCreditCard()); // false, invalid credit card number
}
