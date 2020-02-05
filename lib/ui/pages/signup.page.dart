import 'package:app_post/controllers/auth.controller.dart';
import 'package:app_post/ui/widgets/shared/input-text-form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: signUpForm(context),
      ),
    );
  }
}

Widget signUpForm(BuildContext context) {
  AuthController authController = GetIt.I.get<AuthController>();

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.fitHeight,
            height: 90,
          ),
          SizedBox(
            height: 50,
          ),
          InputTextForm(
            labelText: "nome",
            onChanged: authController.authenticateUser.changeName,
            errorText: authController.authenticateUser.validateName,
            textInputType: TextInputType.text,
            icon: Icons.person,
          ),
          SizedBox(
            height: 10,
          ),
          InputTextForm(
            labelText: "email",
            onChanged: authController.authenticateUser.changEmail,
            errorText: authController.authenticateUser.validateEmail,
            textInputType: TextInputType.emailAddress,
            icon: Icons.email,
          ),
          SizedBox(
            height: 10,
          ),
          InputTextForm(
            labelText: "password",
            onChanged: authController.authenticateUser.changPassword,
            errorText: authController.authenticateUser.validatePassword,
            textInputType: TextInputType.visiblePassword,
            obscureText: authController.authenticateUser.obscureTextPassword,
            icon: Icons.lock,
          ),
          SizedBox(
            height: 20,
          ),
          Observer(
            builder: (_) {
              return Container(
                decoration: BoxDecoration(
                  color: authController.authenticateUser.formIsValid
                      ? Colors.blueAccent
                      : Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: FlatButton(
                  child: Text(
                    "CADASTRAR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: authController.authenticateUser.formIsValid
                      ? authController.registerWithEmailAndPassword
                      : null,
                ),
              );
            },
          )
        ],
      ),
    ),
  );
}
