import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_app/view/BottomButtonWidget.dart';
import 'package:flutter_app/view/comments/CommentButtonWidget.dart';

class BottomActionPostWidget extends StatefulWidget {
  final setLikesCountFunction;
  final Post post;

  const BottomActionPostWidget(
    this.setLikesCountFunction, this.post, {
    Key key,
  }) : super(key: key);

  @override
  _BottomActionPostWidgetState createState() => _BottomActionPostWidgetState();
}

class _BottomActionPostWidgetState extends State<BottomActionPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButtonWidget("Like", "like", widget.setLikesCountFunction),
          CommentButtonWidget("Comment", "message", widget.post),
          BottomButtonWidget("Share", "share", widget.setLikesCountFunction),
          BottomButtonWidget("Send", "send", widget.setLikesCountFunction),
        ],
      ),
    );
  }
}
