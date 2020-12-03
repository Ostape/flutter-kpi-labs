import 'package:flutter/material.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_app/view/BottomActionPostWidget.dart';
import 'package:flutter_app/view/LikesCountViewWidget.dart';
import 'package:flutter_app/view/PostHeaderView.dart';
import 'package:flutter_app/view/PostLineDividerWidget.dart';
import 'package:flutter_app/view/PostMainImageWidget.dart';
import 'package:flutter_app/view/PostTextMessageWidget.dart';

class LinkedinPostWidget extends StatefulWidget {
  final Post post;

  const LinkedinPostWidget({
    this.post,
    Key key,
  }) : super(key: key);

  @override
  _LinkedinPostWidgetState createState() => _LinkedinPostWidgetState();
}

class _LinkedinPostWidgetState extends State<LinkedinPostWidget> {
  String likesCount = "1";

  void setLikesCountState(int newCount) {
    setState(() {
      likesCount = newCount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white70,
          child: Column(
            children: [
              PostHeaderView(post: widget.post),
              PostTextMessageWidget(post: widget.post),
              PostMainImageWidget(post: widget.post),
              LikesCountViewWidget(likesCount),
              PostLineDividerWidget(),
              BottomActionPostWidget(setLikesCountState),
            ],
          ),
        ),
      ],
    );
  }
}
