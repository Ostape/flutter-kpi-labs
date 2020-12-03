import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/Post.dart';

class PostMainImageWidget extends StatelessWidget {
  const PostMainImageWidget({
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
