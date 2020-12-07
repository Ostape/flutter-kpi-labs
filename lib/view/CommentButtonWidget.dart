import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'LinkedinPostWidget.dart';

class CommentButtonWidget extends StatefulWidget {
  final String _iconName;
  final String _iconData;
  final Post post;

  const CommentButtonWidget(this._iconName, this._iconData, this.post,
      {Key key})
      : super(key: key);

  @override
  _CommentButtonWidgetState createState() => _CommentButtonWidgetState();
}

class _CommentButtonWidgetState extends State<CommentButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/${widget._iconData}.svg",
                width: 20,
                height: 20,
              ),
              Text(
                widget._iconName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "SourceSansPro",
                ),
              ),
            ],
          ),
          onTap: () {
            log("logger");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CommentsPageWidget(post: widget.post)));
          },
        ),
      ],
    );
  }
}
