import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          child: CircleAvatar(
            child: Image.network(
              "https://avatars2.githubusercontent.com/u/13282242?s=460&v=4",
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(width: 1, color: Colors.black26),
          ),
          child: FlatButton(
            child: Text("No que você está pensando?"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
