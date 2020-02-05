import 'package:app_post/models/user/authenticate-user.model.dart';
import 'package:app_post/services/auth.service.dart';
import 'package:app_post/services/exceptions/auth-exception.service.dart';
import 'package:app_post/services/message.service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'auth.controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  AuthService _authService = GetIt.I.get<AuthService>();

  @observable
  AuthenticateUser authenticateUser = AuthenticateUser();

  @action
  Future<void> registerWithEmailAndPassword() async {
    try {
      await _authService.register(authenticateUser);
      Get.back();
    } on PlatformException catch (e) {
      MessageService.showSnackBar(AuthExceptionService.getExceptionMessage(e));
    } catch (e) {
      MessageService.showSnackBar(e.toString());
    }
  }

  @action
  Future<void> signIn() async {
    try {
      await _authService.signInWithEmailAndPassword(authenticateUser);
      Get.back();
    } on PlatformException catch (e) {
      MessageService.showSnackBar(AuthExceptionService.getExceptionMessage(e));
    } catch (e) {
      MessageService.showSnackBar(e.toString());
    }
  }

  @action
  Future<void> signOut() async {
    try {
      await _authService.signOut();
    } catch (e) {
      MessageService.showSnackBar(e.toString());
    }
  }
}
