import 'package:app_post/controllers/post/post.controller.dart';
import 'package:app_post/models/post.model.dart';
import 'package:app_post/models/user/user.model.dart';
import 'package:app_post/ui/widgets/post/post-item.widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class PostOwner extends StatelessWidget {
  final PostController postController = GetIt.I.get<PostController>();

  final Post post;

  PostOwner(this.post);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          post.user.photoUrl == null
              ? CircleAvatar(
                  radius: 20.0,
                  child: Image.asset("assets/images/user.png"),
                )
              : CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(post.user.photoUrl),
                ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  post.user.displayName ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(post.diferenceToDateTimeNow ?? ''),
              ],
            ),
          ),
          user == null || user.uid != post.user.uid
              ? SizedBox()
              : PopupMenuButton(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<MenuPostOptions>>[
                    const PopupMenuItem<MenuPostOptions>(
                      value: MenuPostOptions.edit,
                      child: Text('Editar'),
                    ),
                    const PopupMenuItem<MenuPostOptions>(
                      value: MenuPostOptions.delete,
                      child: Text('Excluir'),
                    ),
                  ],
                  onSelected: (MenuPostOptions value) {
                    switch (value) {
                      case MenuPostOptions.edit:
                        print(post.documentId);
                        postController.edit(post);
                        break;
                      case MenuPostOptions.delete:
                        postController.delete(post.documentId);
                        break;
                      default:
                        break;
                    }
                  },
                ),
        ],
      ),
    );
  }
}
