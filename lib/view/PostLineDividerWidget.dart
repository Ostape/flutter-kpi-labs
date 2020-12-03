import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostLineDividerWidget extends StatelessWidget {
  const PostLineDividerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Divider(
        color: Colors.grey,
        height: 10,
        thickness: 1,
      ),
    );
  }
}
