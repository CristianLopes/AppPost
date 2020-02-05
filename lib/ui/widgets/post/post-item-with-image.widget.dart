import 'package:app_post/models/post.model.dart';
import 'package:app_post/ui/widgets/post/post-content.widget.dart';
import 'package:app_post/utils/string-utility.dart';
import 'package:flutter/material.dart';

class PostItemWithImage extends StatelessWidget {
  final Post post;
  PostItemWithImage(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Image.memory(StringUtility.dataFromBase64String(post.image)),
          SizedBox(
            width: 10,
          ),
          PostItemContent(post),
        ],
      ),
    );
  }
}
