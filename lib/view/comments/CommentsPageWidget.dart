import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_app/view/comments/CommentsPost.dart';
import 'package:provider/provider.dart';

class CommentsPageWidget extends StatefulWidget {
  const CommentsPageWidget({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  _CommentsPageWidgetState createState() => _CommentsPageWidgetState();
}

class _CommentsPageWidgetState extends State<CommentsPageWidget> {
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
