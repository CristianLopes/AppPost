// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate-user.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticateUser on _AuthenticateUserBase, Store {
  Computed<bool> _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid)).value;

  final _$nameAtom = Atom(name: '_AuthenticateUserBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_AuthenticateUserBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_AuthenticateUserBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$obscureTextPasswordAtom =
      Atom(name: '_AuthenticateUserBase.obscureTextPassword');

  @override
  bool get obscureTextPassword {
    _$obscureTextPasswordAtom.context
        .enforceReadPolicy(_$obscureTextPasswordAtom);
    _$obscureTextPasswordAtom.reportObserved();
    return super.obscureTextPassword;
  }

  @override
  set obscureTextPassword(bool value) {
    _$obscureTextPasswordAtom.context.conditionallyRunInAction(() {
      super.obscureTextPassword = value;
      _$obscureTextPasswordAtom.reportChanged();
    }, _$obscureTextPasswordAtom,
        name: '${_$obscureTextPasswordAtom.name}_set');
  }

  final _$_AuthenticateUserBaseActionController =
      ActionController(name: '_AuthenticateUserBase');

  @override
  dynamic changeName(String newValue) {
    final _$actionInfo = _$_AuthenticateUserBaseActionController.startAction();
    try {
      return super.changeName(newValue);
    } finally {
      _$_AuthenticateUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changEmail(String newValue) {
    final _$actionInfo = _$_AuthenticateUserBaseActionController.startAction();
    try {
      return super.changEmail(newValue);
    } finally {
      _$_AuthenticateUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changPassword(String newValue) {
    final _$actionInfo = _$_AuthenticateUserBaseActionController.startAction();
    try {
      return super.changPassword(newValue);
    } finally {
      _$_AuthenticateUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changObscureTextPassword(bool newValue) {
    final _$actionInfo = _$_AuthenticateUserBaseActionController.startAction();
    try {
      return super.changObscureTextPassword(newValue);
    } finally {
      _$_AuthenticateUserBaseActionController.endAction(_$actionInfo);
    }
  }
}
