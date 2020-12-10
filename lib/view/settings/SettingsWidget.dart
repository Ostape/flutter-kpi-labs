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
                margin: EdgeInsets.only(top: 20), child: JsonDataShowWidget()),
          ],
        ),
      ),
    );
  }
}
