import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_app/view/CommentWidget.dart';
import 'package:flutter_app/view/LinkedinPostWidget.dart';
import 'package:provider/provider.dart';

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
