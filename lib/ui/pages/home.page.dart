import 'package:app_post/controllers/home.controller.dart';
import 'package:app_post/enum/authenticated-options.enum.dart';
import 'package:app_post/enum/unauthenticated-option.enum.dart';
import 'package:app_post/models/user/user.model.dart';
import 'package:app_post/ui/pages/upload-post.page.dart';
import 'package:app_post/ui/widgets/post/list-of-posts.widget.dart';
import 'package:app_post/ui/widgets/post/post-item.widget.dart';
import 'package:app_post/ui/widgets/shared/popup-menu-user-authenticated.dart';
import 'package:app_post/ui/widgets/shared/popup-menu-user-unauthenticated.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        leading: user != null
            ? PopupMenuUserAuthenticated()
            : PopupMenuUserUnAuthenticated(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              if (user == null) {
                Get.snackbar(
                  "Atenção",
                  "Somente usuários autenticados podem criar uma nova postagem.",
                  snackPosition: SnackPosition.TOP,
                  colorText: Colors.black,
                );
              } else {
                Get.to(UploadPostPage());
              }
            },
          ),
        ],
        title: Text("Posts"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Observer(
            builder: (_) {
              if (homeController.posts?.data == null) {
                return Center(child: CircularProgressIndicator());
              }
              return ListOfPosts(homeController.posts.data);
            },
          ),
        ),
      ),
    );
  }
}
