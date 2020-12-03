import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/Post.dart';

class PostTextMessageWidget extends StatelessWidget {
  const PostTextMessageWidget({
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
