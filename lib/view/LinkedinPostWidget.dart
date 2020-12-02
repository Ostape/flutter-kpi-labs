import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              PostTextMessageView(post: widget.post),
              PostMainImageView(post: widget.post),
              LikesCountViewWidget(likesCount),
              PostLineDivider(),
              BottomActionPostView(setLikesCountState),
            ],
          ),
        ),
      ],
    );
  }
}

class PostMainImageView extends StatelessWidget {
  const PostMainImageView({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Image(
        image: NetworkImage(
          post.userPostImage,
        ),
      ),
    );
  }
}

class PostTextMessageView extends StatelessWidget {
  const PostTextMessageView({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 10,
      ),
      child: Text(
        post.userText,
        style: TextStyle(fontFamily: "SourceSansPro"),
      ),
    );
  }
}

class PostHeaderView extends StatelessWidget {
  const PostHeaderView({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(post.userAvatar),
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  post.userStatus,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "10h",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LikesCountViewWidget extends StatefulWidget {
  final String likesCount;

  LikesCountViewWidget(this.likesCount);

  @override
  _LikesCountViewWidgetState createState() => _LikesCountViewWidgetState();
}

class _LikesCountViewWidgetState extends State<LikesCountViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/heart.svg",
            width: 15,
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 3,
            ),
            child: Text(
              widget.likesCount,
            ),
          )
        ],
      ),
    );
  }
}

class PostLineDivider extends StatelessWidget {
  const PostLineDivider({
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

class BottomActionPostView extends StatefulWidget {
  final setLikesCountFunction;

  const BottomActionPostView(
    this.setLikesCountFunction, {
    Key key,
  }) : super(key: key);

  @override
  _BottomActionPostViewState createState() => _BottomActionPostViewState();
}

class _BottomActionPostViewState extends State<BottomActionPostView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButton("Like", "like", widget.setLikesCountFunction),
          BottomButton("Comment", "message", widget.setLikesCountFunction),
          BottomButton("Share", "share", widget.setLikesCountFunction),
          BottomButton("Send", "send", widget.setLikesCountFunction),
        ],
      ),
    );
  }
}

class BottomButton extends StatefulWidget {
  final String _iconName;
  final String _iconData;
  final setLikesCountFunction;

  const BottomButton(this._iconName, this._iconData, this.setLikesCountFunction,
      {Key key})
      : super(key: key);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            "assets/images/${widget._iconData}.svg",
            width: 20,
            height: 20,
          ),
          onTap: () {
            widget.setLikesCountFunction(count++);
            log("logger");
          },
        ),
        Text(
          widget._iconName,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "SourceSansPro",
          ),
        ),
      ],
    );
  }
}
