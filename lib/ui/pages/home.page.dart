import 'package:app_post/controllers/home.controller.dart';
import 'package:app_post/enum/authenticated-options.enum.dart';
import 'package:app_post/enum/unauthenticated-option.enum.dart';
import 'package:app_post/models/post.model.dart';
import 'package:app_post/models/user/user.model.dart';
import 'package:app_post/ui/pages/upload-post.page.dart';
import 'package:app_post/ui/widgets/post/post-item.widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = GetIt.I.get<HomeController>();

  _popupMenuUserAuthenticated(User user) {
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

  _popupMenuUserUnAuthenticated() {
    return PopupMenuButton(
      offset: Offset(0, 100),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 30.0,
          child: Image.asset("assets/images/user.png"),
          // backgroundImage: NetworkImage(
          //     "https://avatars2.githubusercontent.com/u/13282242?s=460&v=4"),
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

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        leading: user != null
            ? _popupMenuUserAuthenticated(user)
            : _popupMenuUserUnAuthenticated(),
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
              if (homeController.posts.data == null) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: homeController.posts.data,
                itemBuilder: (_, index) {
                  print(homeController.posts.data[index]);
                  var post = Post.fromMap(homeController.posts.data[index]);
                  return Column(
                    children: <Widget>[
                      PostItem(
                        post,
                      ),
                      Divider(
                        height: 10,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

//  StreamBuilder<QuerySnapshot>(
//         stream: Firestore.instance.collection('posts').snapshots(),
//         builder:
//             (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//             default:
//               return Container(
//                 height: 500,
//                 child: ListView(
//                   children: snapshot.data.documents
//                       .map((DocumentSnapshot document) {
//                     if (document.data == null) {
//                       return ListTile(
//                         title: Text("documento nulo"),
//                         subtitle: Text("documento nulo"),
//                       );
//                     } else {
//                       return Column(
//                         children: <Widget>[
//                           PostItem(
//                             Post.fromMap(document),
//                           ),
//                           Divider(
//                             height: 10,
//                           ),
//                         ],
//                       );
//                     }
//                   }).toList(),
//                 ),
//               );
//           }
//         },
//       ),
