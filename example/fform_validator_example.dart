import 'package:fform_validator/fform_validator.dart'; // Assuming this exists


void main() {
  FFormValidator('hello').isRequired; // true, because the string is not empty
  FFormValidator('').isRequired; // false, because the string is empty

  FFormValidator('test@example.com').isEmail; // true, because it is a valid email
  FFormValidator('invalid-email').isEmail; // false, because the email is invalid

  FFormValidator('https://www.example.com').isUrl; // true, because it is a valid URL
  FFormValidator('invalid-url').isUrl; // false, because it is an invalid URL

  FFormValidator('hello').isMinLength(3); // true, the string length is greater than 3
  FFormValidator('hi').isMinLength(3); // false, the string length is less than 3

  FFormValidator('hi').isMaxLength(5); // true, the string length is less than or equal to 5
  FFormValidator('hello world').isMaxLength(5); // false, the string length is greater than 5

  FFormValidator('hello').isLength(5); // true, the string length is exactly 5
  FFormValidator('hello').isLength(3); // false, the string length is not equal to 3

  FFormValidator('192.168.1.1').isIp; // true, it is a valid IP
  FFormValidator('999.999.999.999').isIp; // false, it is an invalid IP

  FFormValidator('2001:0db8:85a3:0000:0000:8a2e:0370:7334').isIpv6; // true, it is a valid IPv6 address
  FFormValidator('invalid-ipv6').isIpv6; // false, it is an invalid IPv6 address

  FFormValidator('12345').isNumber; // true, the string contains only digits
  FFormValidator('abc123').isNumber; // false, the string contains letters

  FFormValidator('12asd5').isHaveNumber; // true, the string contains digits
  FFormValidator('abcasd').isHaveNumber; // false, the string does not contain digits

  FFormValidator('12.5').isFloat; // true, the string contains a float
  FFormValidator('12').isFloat; // true, the string contains an int

  FFormValidator('12asd5').isHaveFloat; // true, the string contains a float
  FFormValidator('abcasd').isHaveFloat; // false, the string does not contain a float

  FFormValidator('hello').isLowercase; // true, the string is in lowercase
  FFormValidator('Hello').isLowercase; // false, the string contains uppercase letters

  FFormValidator('HELLO').isUppercase; // true, the string is in uppercase
  FFormValidator('Hello').isUppercase; // false, the string contains lowercase letters

  FFormValidator('hello!').isHaveSpecialChar; // true, the string contains a special character
  FFormValidator('hello').isHaveSpecialChar; // false, the string does not contain special characters

  FFormValidator('1234 5678 1234 5678').isCreditCard(); // true, valid credit card number with spaces
  FFormValidator('invalid-card-number').isCreditCard(); // false, invalid credit card number
}