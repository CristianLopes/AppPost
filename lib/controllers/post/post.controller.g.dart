// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostController on _PostControllerBase, Store {
  final _$_PostControllerBaseActionController =
      ActionController(name: '_PostControllerBase');

  @override
  dynamic delete(String documentId) {
    final _$actionInfo = _$_PostControllerBaseActionController.startAction();
    try {
      return super.delete(documentId);
    } finally {
      _$_PostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic edit(Post post) {
    final _$actionInfo = _$_PostControllerBaseActionController.startAction();
    try {
      return super.edit(post);
    } finally {
      _$_PostControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
