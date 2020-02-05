import 'package:app_post/controllers/auth.controller.dart';
import 'package:app_post/ui/pages/signup.page.dart';
import 'package:app_post/ui/widgets/shared/input-text-form.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: loginForm(),
      ),
    );
  }
}

Widget loginForm() {
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
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent, //Color(0xff6092ff),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: FlatButton(
              child: Text(
                "ENTRAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: authController.signIn,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                child: Text(
                  "ESQUECEU A SENHA?",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                  // style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.snackbar("Atenção",
                      "Esta funcionalidade ainda não está disponivel.");
                },
              ),
              FlatButton(
                child: Text(
                  "CADASTRE-SE",
                  // style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.off(SignUpPage());
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
