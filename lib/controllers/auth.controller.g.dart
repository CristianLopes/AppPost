// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$authenticateUserAtom =
      Atom(name: '_AuthControllerBase.authenticateUser');

  @override
  AuthenticateUser get authenticateUser {
    _$authenticateUserAtom.context.enforceReadPolicy(_$authenticateUserAtom);
    _$authenticateUserAtom.reportObserved();
    return super.authenticateUser;
  }

  @override
  set authenticateUser(AuthenticateUser value) {
    _$authenticateUserAtom.context.conditionallyRunInAction(() {
      super.authenticateUser = value;
      _$authenticateUserAtom.reportChanged();
    }, _$authenticateUserAtom, name: '${_$authenticateUserAtom.name}_set');
  }

  final _$registerWithEmailAndPasswordAsyncAction =
      AsyncAction('registerWithEmailAndPassword');

  @override
  Future<void> registerWithEmailAndPassword() {
    return _$registerWithEmailAndPasswordAsyncAction
        .run(() => super.registerWithEmailAndPassword());
  }

  final _$signInAsyncAction = AsyncAction('signIn');

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }
}
