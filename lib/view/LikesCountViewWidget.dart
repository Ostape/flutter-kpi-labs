import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
