import 'package:app_post/models/post.model.dart';
import 'package:flutter/material.dart';

class PostItemContent extends StatelessWidget {
  final Post post;

  PostItemContent(this.post);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  post.body,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
