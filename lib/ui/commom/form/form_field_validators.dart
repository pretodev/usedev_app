import 'package:flutter/material.dart';

import '../../../business/commom/values/email.dart';

FormFieldValidator<String> filedValidator(
  bool Function(String value) validate, {
  String message = 'Campo inválido',
}) {
  return (value) {
    if (!validate(value ?? '')) {
      return message;
    }
    return null;
  };
}

FormFieldValidator<String> emailValidator = filedValidator(
  Email.validator.call,
  message: 'Endereço de e-mail inválido',
);
