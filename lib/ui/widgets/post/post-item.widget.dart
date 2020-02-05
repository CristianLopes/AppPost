import 'package:app_post/models/post.model.dart';
import 'package:app_post/ui/widgets/post/post-item-with-image.widget.dart';
import 'package:app_post/ui/widgets/post/post-item-without-image.widget.dart';
import 'package:app_post/ui/widgets/post/post-owner.widget.dart';
import 'package:flutter/material.dart';

enum MenuPostOptions { edit, delete }

class PostItem extends StatelessWidget {
  final Post post;
  PostItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: PostOwner(post),
        ),
        SizedBox(
          height: 10,
        ),
        post.image == null
            ? PostItemWithoutImage(post)
            : PostItemWithImage(post),
      ],
    );
  }
}
