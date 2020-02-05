import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
part 'authenticate-user.model.g.dart';

class AuthenticateUser = _AuthenticateUserBase with _$AuthenticateUser;

abstract class _AuthenticateUserBase with Store {
  @observable
  String name;

  @observable
  String email;

  @observable
  String password;

  @observable
  bool obscureTextPassword = true;

  @computed
  bool get formIsValid {
    return validateEmail() == null && validatePassword() == null;
  }

  @action
  changeName(String newValue) => name = newValue;

  @action
  changEmail(String newValue) => email = newValue;

  @action
  changPassword(String newValue) => password = newValue;

  @action
  changObscureTextPassword(bool newValue) => obscureTextPassword = newValue;

  String validateEmail() {
    bool isValid = EmailValidator.validate(email ?? '');
    return isValid ? null : "Email inválido";
  }

  String validateName() {
    bool isValid = name == null ? false : name.length >= 2;
    return isValid ? null : "Nome é obrigatório";
  }

  String validatePassword() {
    bool isValid = password == null ? false : password.length >= 6;
    return isValid
        ? null
        : "o campo de senha precisa ter no mínimo 6 caracteres";
  }
}
