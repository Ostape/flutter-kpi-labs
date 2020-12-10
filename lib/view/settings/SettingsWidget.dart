
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/view/settings/AnimatedToggleButton.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text("Settings Screen"), AnimatedToggleButton()],
        ),
      ),
    );
  }
}
