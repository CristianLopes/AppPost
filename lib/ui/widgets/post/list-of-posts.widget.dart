import 'package:app_post/models/post.model.dart';
import 'package:flutter/material.dart';
import 'post-item.widget.dart';

class ListOfPosts extends StatelessWidget {
  final List<Post> posts;

  ListOfPosts(this.posts);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          return Column(
            children: <Widget>[
              PostItem(posts[index]),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 10,
          );
        },
      ),
    );
  }
}
