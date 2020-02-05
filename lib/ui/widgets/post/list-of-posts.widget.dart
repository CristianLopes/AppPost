import 'package:app_post/models/post.model.dart';
import 'package:flutter/material.dart';

import 'post-item.widget.dart';

class ListOfPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return PostItem(
            Post(
              title: "N2BBrasil",
              body:
                  "Está é uma postagem aleatoria sobre o desafio da N2BBrasil que eu com certeza vou passar",
              image:
                  "https://avatars2.githubusercontent.com/u/13282242?s=460&v=4",
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 20,
            color: Colors.black87,
          );
        },
      ),
    );
  }
}
