import 'package:app_post/controllers/home.controller.dart';
import 'package:app_post/enum/unauthenticated-option.enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PopupMenuUserUnAuthenticated extends StatelessWidget {
  final HomeController homeController = GetIt.I.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 100),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 30.0,
          child: Image.asset("assets/images/user.png"),
          backgroundColor: Colors.transparent,
        ),
      ),
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<UnAuthenticatedOptions>>[
        const PopupMenuItem<UnAuthenticatedOptions>(
          value: UnAuthenticatedOptions.signIn,
          child: Text('Entrar'),
        ),
        const PopupMenuItem<UnAuthenticatedOptions>(
          value: UnAuthenticatedOptions.signUp,
          child: Text('Cadastrar-se'),
        ),
      ],
      onSelected: (UnAuthenticatedOptions value) {
        switch (value) {
          case UnAuthenticatedOptions.signIn:
            homeController.goToSignIn();
            break;
          case UnAuthenticatedOptions.signUp:
            homeController.goToSignUp();
            break;
          default:
            break;
        }
      },
    );
  }
}
