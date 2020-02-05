import 'package:app_post/models/user/user.model.dart';
import 'package:app_post/services/auth.service.dart';
import 'package:app_post/services/ioc.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import './ui/pages/splash-screen.page.dart';

void main() async {
  IocService().setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: GetIt.I.get<AuthService>().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenPage(),
        navigatorKey: Get.key,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.lightBlueAccent,
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  button: TextStyle(color: Colors.white),
                ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
            )),
      ),
    );
  }
}
