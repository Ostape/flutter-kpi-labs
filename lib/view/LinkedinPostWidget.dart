import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_app/view/BottomActionPostWidget.dart';
import 'package:flutter_app/view/CommentWidget.dart';
import 'package:flutter_app/view/LikesCountViewWidget.dart';
import 'package:flutter_app/view/PostHeaderView.dart';
import 'package:flutter_app/view/PostLineDividerWidget.dart';
import 'package:flutter_app/view/PostMainImageWidget.dart';
import 'package:flutter_app/view/PostTextMessageWidget.dart';
import 'package:provider/provider.dart';

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

class CommentsPageWidget extends StatelessWidget {
  final Post post;

  CommentsPageWidget({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: post,
      child: SomeWidget(post: post),
    );
  }
}

class SomeWidget extends StatefulWidget {
  const SomeWidget({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  _SomeWidgetState createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  final myController = TextEditingController();

  @override
  void dispose() {
    Provider.of<Post>(context).dispose();
    super.dispose();
  }

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
          child: CommentsPost(post: widget.post),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        child: Row(
          children: [
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: "Comment post",
                ),
              ),
            ),
            Container(
              width: 36,
              height: 36,
              child: IconButton(
                onPressed: () {
                  log("message");
                  Provider.of<Post>(context, listen: false)
                      .addComment(myController.text.toString());
                  myController.text = "";
                },
                icon: Icon(
                  Icons.send,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentsPost extends StatelessWidget {
  const CommentsPost({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: Provider.of<Post>(context).comments.length,
            separatorBuilder: (_, index) => Divider(
              color: Colors.grey[300],
              thickness: 2,
            ),
            itemBuilder: (_, index) => CommentWidget(
                comment: Provider.of<Post>(context).comments[index]),
          ),
        ),
      ],
    );
  }
}