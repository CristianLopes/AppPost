import 'package:app_post/controllers/home.controller.dart';
import 'package:app_post/enum/authenticated-options.enum.dart';
import 'package:app_post/models/user/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class PopupMenuUserAuthenticated extends StatelessWidget {
  final HomeController homeController = GetIt.I.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return PopupMenuButton(
      offset: Offset(0, 100),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: user.photoUrl == null
            ? CircleAvatar(
                radius: 30.0,
                child: Image.asset("assets/images/userauthenticated.png"),
                // backgroundImage: NetworkImage(
                //     "https://avatars2.githubusercontent.com/u/13282242?s=460&v=4"),
                backgroundColor: Colors.transparent,
              )
            : CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(user.photoUrl),
                backgroundColor: Colors.transparent,
              ),
      ),
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<AuthenticatedOptions>>[
        const PopupMenuItem<AuthenticatedOptions>(
          value: AuthenticatedOptions.logOut,
          child: Text('Sair'),
        ),
      ],
      onSelected: (AuthenticatedOptions value) {
        switch (value) {
          // case AuthenticatedOptions.profile:
          //   homeController.goToProfile();
          //   break;
          case AuthenticatedOptions.logOut:
            homeController.signOut();
            break;
          default:
            break;
        }
      },
    );
  }
}
