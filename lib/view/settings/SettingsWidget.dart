import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/view/settings/AnimatedToggleButton.dart';
import 'package:flutter_app/view/settings/JsonDataShowWidget.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings Screen"),
            AnimatedToggleButton(),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: JsonDataShowWidget(),
            ),
            SizedBox(height: 30),
            AnimatedBackgroundWidget()
          ],
        ),
      ),
    );
  }
}

class AnimatedBackgroundWidget extends StatefulWidget {
  const AnimatedBackgroundWidget({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedBackgroundWidgetState createState() =>
      _AnimatedBackgroundWidgetState();
}

class _AnimatedBackgroundWidgetState extends State<AnimatedBackgroundWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;

  _AnimatedBackgroundWidgetState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 4500),
      vsync: this,
    );

    animation = ColorTween(
            begin: Color.fromRGBO(255, 0, 0, 1.0),
            end: Color.fromRGBO(0, 0, 255, 1.0))
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: animation.value),
      height: 100,
    );
  }
}
