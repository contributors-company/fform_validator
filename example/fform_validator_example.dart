import 'package:fform_validator/fform_validator.dart'; // Assuming this exists

void main() {
  final validator = FFormValidator('hello');
  print(validator.isRequired); // true, так как строка не пустая

  final validator2 = FFormValidator('');
  print(validator2.isRequired); // false, так как строка пустая

  final emailValidator = FFormValidator('test@example.com');
  print(emailValidator.isEmail); // true, так как это валидный email

  final emailValidator2 = FFormValidator('invalid-email');
  print(emailValidator2.isEmail); // false, так как email невалидный

  final urlValidator = FFormValidator('https://www.example.com');
  print(urlValidator.isUrl); // true, так как это валидный URL

  final urlValidator2 = FFormValidator('invalid-url');
  print(urlValidator2.isUrl); // false, так как это невалидный URL

  final minLengthValidator = FFormValidator('hello');
  print(minLengthValidator.isMinLength(3)); // true, длина строки больше 3

  final minLengthValidator2 = FFormValidator('hi');
  print(minLengthValidator2.isMinLength(3)); // false, длина строки меньше 3

  final maxLengthValidator = FFormValidator('hi');
  print(maxLengthValidator
      .isMaxLength(5)); // true, длина строки меньше или равна 5

  final maxLengthValidator2 = FFormValidator('hello world');
  print(maxLengthValidator2.isMaxLength(5)); // false, длина строки больше 5

  final lengthValidator = FFormValidator('hello');
  print(lengthValidator.isLength(5)); // true, длина строки ровно 5

  final lengthValidator2 = FFormValidator('hello');
  print(lengthValidator2.isLength(3)); // false, длина строки не равна 3

  final ipValidator = FFormValidator('192.168.1.1');
  print(ipValidator.isIp); // true, это валидный IP

  final ipValidator2 = FFormValidator('999.999.999.999');
  print(ipValidator2.isIp); // false, это невалидный IP

  final ipv6Validator =
      FFormValidator('2001:0db8:85a3:0000:0000:8a2e:0370:7334');
  print(ipv6Validator.isIpv6); // true, это валидный IPv6 адрес

  final ipv6Validator2 = FFormValidator('invalid-ipv6');
  print(ipv6Validator2.isIpv6); // false, это невалидный IPv6 адрес

  final numericValidator = FFormValidator('12345');
  print(numericValidator.isNumber); // true, строка содержит только цифры

  final numericValidator2 = FFormValidator('abc123');
  print(numericValidator2.isNumber); // false, строка содержит буквы

  final numericValidator3 = FFormValidator('12asd5');
  print(numericValidator3.isHaveNumber); // true, строка содержит цифры

  final numericValidator4 = FFormValidator('abcasd');
  print(numericValidator4.isHaveNumber); // false, строка не содержит цифры

  final floatValidator = FFormValidator('12.5');
  print(floatValidator.isFloat); // true, строка содержит float

  final floatValidator2 = FFormValidator('12');
  print(floatValidator2.isFloat); // true, строка содержит int

  final floatValidator3 = FFormValidator('12asd5');
  print(floatValidator3.isHaveFloat); // true, строка содержит float

  final floatValidator4 = FFormValidator('abcasd');
  print(floatValidator4.isHaveFloat); // false, строка не содержит float

  final lowercaseValidator = FFormValidator('hello');
  print(lowercaseValidator.isLowercase); // true, строка в нижнем регистре

  final lowercaseValidator2 = FFormValidator('Hello');
  print(lowercaseValidator2
      .isLowercase); // false, строка содержит заглавные буквы

  final uppercaseValidator = FFormValidator('HELLO');
  print(uppercaseValidator.isUppercase); // true, строка в верхнем регистре

  final uppercaseValidator2 = FFormValidator('Hello');
  print(
      uppercaseValidator2.isUppercase); // false, строка содержит строчные буквы

  final specialCharValidator = FFormValidator('hello!');
  print(specialCharValidator
      .isHaveSpecialChar); // true, строка содержит специальный символ

  final specialCharValidator2 = FFormValidator('hello');
  print(specialCharValidator2
      .isHaveSpecialChar); // false, строка не содержит специальных символов

  final creditCardValidator = FFormValidator('1234 5678 1234 5678');
  print(creditCardValidator
      .isCreditCard()); // true, валидный номер кредитной карты с пробелами

  final creditCardValidator2 = FFormValidator('invalid-card-number');
  print(creditCardValidator2
      .isCreditCard()); // false, невалидный номер кредитной карты
}
