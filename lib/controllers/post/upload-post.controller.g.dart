// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload-post.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UploadPostController on _UploadPostControllerBase, Store {
  final _$uploadPostAtom = Atom(name: '_UploadPostControllerBase.uploadPost');

  @override
  UploadPost get uploadPost {
    _$uploadPostAtom.context.enforceReadPolicy(_$uploadPostAtom);
    _$uploadPostAtom.reportObserved();
    return super.uploadPost;
  }

  @override
  set uploadPost(UploadPost value) {
    _$uploadPostAtom.context.conditionallyRunInAction(() {
      super.uploadPost = value;
      _$uploadPostAtom.reportChanged();
    }, _$uploadPostAtom, name: '${_$uploadPostAtom.name}_set');
  }

  final _$_UploadPostControllerBaseActionController =
      ActionController(name: '_UploadPostControllerBase');

  @override
  dynamic publish(User user) {
    final _$actionInfo =
        _$_UploadPostControllerBaseActionController.startAction();
    try {
      return super.publish(user);
    } finally {
      _$_UploadPostControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
