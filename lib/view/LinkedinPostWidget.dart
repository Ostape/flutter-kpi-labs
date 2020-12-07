
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
  String likesCount = "";

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
              BottomActionPostWidget(setLikesCountState, widget.post),
            ],
          ),
        ),
      ],
    );
  }
}

class CommentsWidget extends StatelessWidget {
  final Post post;

  final List<String> commentsList = [
    "Some comment1",
    "Some comment2",
    "Some comment3",
  ];

  CommentsWidget({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAlias,
        child: Container(
          margin: EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              LinkedinPostWidget(
                post: post,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [Text("Comments")],
                ),
              ),
              Container(
                height: 600,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: commentsList.length,
                  separatorBuilder: (_, index) => Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                  ),
                  itemBuilder: (_, index) =>
                      CommentWidget(comment: commentsList[index]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: TextFormField(
        decoration: InputDecoration(
          hintText: "Comment post",
          border: new OutlineInputBorder(
            borderSide: new BorderSide(),
          ),
        ),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key key, @required this.comment}) : super(key: key);

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
                )),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(7),
                    bottomRight: const Radius.circular(7),
                    bottomLeft: const Radius.circular(7),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Orest Shemeliuk"),
                  Text("Software Engineer"),
                  Text("2w"),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      comment,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
