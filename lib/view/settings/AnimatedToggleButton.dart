import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimatedToggleButton extends StatefulWidget {
  const AnimatedToggleButton({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedToggleButtonState createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
  bool toggleValue = false;

  @override
  void initState() {
    super.initState();
    _initToggleValue();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 40.0,
        width: 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: toggleValue
                ? Colors.greenAccent[100]
                : Colors.redAccent[100].withOpacity(0.5)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
              top: 3.0,
              left: toggleValue ? 60.0 : 0.0,
              right: toggleValue ? 0.0 : 60.0,
              child: InkWell(
                onTap: toggleButton,
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 1000),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return RotationTransition(
                        child: child,
                        turns: animation,
                      );
                    },
                    child: toggleValue
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 35.0,
                            key: UniqueKey(),
                          )
                        : Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                            size: 35.0,
                            key: UniqueKey(),
                          )),
              ),
            )
          ],
        ),
      ),
    );
  }

  _initToggleValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    toggleValue = prefs.getBool('toggleValue') ?? false;
    setState(() {});
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    toggleValue = !toggleValue;
    await prefs.setBool('toggleValue', toggleValue);
  }

  toggleButton() => {
        setState(() => {_incrementCounter()})
      };
}
