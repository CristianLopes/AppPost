import 'package:app_post/constants/exceptions/auth.exception.types.dart';
import 'package:flutter/services.dart';

class AuthExceptionService {
  static String getExceptionMessage(PlatformException exception) {
    switch (exception.code) {
      case AuthExceptionTypes.ERROR_USER_NOT_FOUND:
        return "Usuário não encontrado";
      case AuthExceptionTypes.ERROR_INVALID_EMAIL:
        return "Endereço de e-mail invalido";
      case AuthExceptionTypes.ERROR_USER_DISABLED:
        return "Este usuário está desabilitado, consulte o admin do sistema";
      case AuthExceptionTypes.ERROR_WRONG_PASSWORD:
        return "Usuário e/ou senha incorretos.";
      case AuthExceptionTypes.ERROR_EMAIL_ALREADY_IN_USE:
        return "Este e-mail já está sendo usado por outro usuário.";
      case AuthExceptionTypes.ERROR_WEAK_PASSWORD:
        return "Senha fraca, para melhor proteger suas informações digite uma senha com pelo menos 6 digitos";
      default:
        return exception.message;
    }
  }
}
