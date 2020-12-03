import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomButtonWidget extends StatefulWidget {
  final String _iconName;
  final String _iconData;
  final setLikesCountFunction;

  const BottomButtonWidget(
      this._iconName, this._iconData, this.setLikesCountFunction,
      {Key key})
      : super(key: key);

  @override
  _BottomButtonWidgetState createState() => _BottomButtonWidgetState();
}

class _BottomButtonWidgetState extends State<BottomButtonWidget> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            "assets/images/${widget._iconData}.svg",
            width: 20,
            height: 20,
          ),
          onTap: () {
            widget.setLikesCountFunction(count++);
            log("logger");
          },
        ),
        Text(
          widget._iconName,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "SourceSansPro",
          ),
        ),
      ],
    );
  }
}
