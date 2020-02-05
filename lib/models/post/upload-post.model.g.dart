// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload-post.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UploadPost on _UploadPostBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$titleAtom = Atom(name: '_UploadPostBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$bodyAtom = Atom(name: '_UploadPostBase.body');

  @override
  String get body {
    _$bodyAtom.context.enforceReadPolicy(_$bodyAtom);
    _$bodyAtom.reportObserved();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.context.conditionallyRunInAction(() {
      super.body = value;
      _$bodyAtom.reportChanged();
    }, _$bodyAtom, name: '${_$bodyAtom.name}_set');
  }

  final _$imageAtom = Atom(name: '_UploadPostBase.image');

  @override
  String get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$_UploadPostBaseActionController =
      ActionController(name: '_UploadPostBase');

  @override
  dynamic changeTitle(String newValue) {
    final _$actionInfo = _$_UploadPostBaseActionController.startAction();
    try {
      return super.changeTitle(newValue);
    } finally {
      _$_UploadPostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBody(String newValue) {
    final _$actionInfo = _$_UploadPostBaseActionController.startAction();
    try {
      return super.changeBody(newValue);
    } finally {
      _$_UploadPostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeImage(String newValue) {
    final _$actionInfo = _$_UploadPostBaseActionController.startAction();
    try {
      return super.changeImage(newValue);
    } finally {
      _$_UploadPostBaseActionController.endAction(_$actionInfo);
    }
  }
}
