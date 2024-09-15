import '../validator.dart';

class Email {
  static Validator<String> get validator {
    return Validator<String>((address) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      return emailRegex.hasMatch(address);
    });
  }

  final String address;

  Email(this.address) {
    if (!validator(address)) {
      throw FormatException('Endereço de e-mail inválido: $address');
    }
  }
}
