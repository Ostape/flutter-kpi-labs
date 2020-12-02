import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkedinPostWidget extends StatelessWidget {
  final Post post;

  const LinkedinPostWidget({
    this.post,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white70,
          child: Column(
            children: [
              PostHeaderView(post: post),
              PostTextMessageView(post: post),
              PostMainImageView(post: post),
              LikesCountView(),
              PostLineDivider(),
              BottomActionPostView(),
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

class LikesCountView extends StatelessWidget {
  const LikesCountView({
    Key key,
  }) : super(key: key);

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
              "2",
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

class BottomActionPostView extends StatelessWidget {
  const BottomActionPostView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButton("Like", "like"),
          BottomButton("Comment", "message"),
          BottomButton("Share", "share"),
          BottomButton("Send", "send"),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String _iconName;
  final String _iconData;

  const BottomButton(this._iconName, this._iconData, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            "assets/images/$_iconData.svg",
            width: 20,
            height: 20,
          ),
          onTap: () {
            log("assss");
          },
        ),
        Text(
          _iconName,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "SourceSansPro",
          ),
        ),
      ],
    );
  }
}
