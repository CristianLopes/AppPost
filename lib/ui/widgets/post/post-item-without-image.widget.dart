import 'package:app_post/models/post.model.dart';
import 'package:app_post/ui/widgets/post/post-content.widget.dart';
import 'package:flutter/material.dart';

class PostItemWithoutImage extends StatelessWidget {
  final Post post;
  PostItemWithoutImage(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[PostItemContent(post)],
      ),
    );
  }
}
