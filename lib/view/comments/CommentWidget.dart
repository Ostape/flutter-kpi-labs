import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
