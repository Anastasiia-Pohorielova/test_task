import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_task/res/app_styles/app_shadows.dart';
import 'package:test_task/ui/widgets/pointer_widget.dart';

/// A class that describe Main screen of the app
class MainPage extends StatefulWidget {
  /// The constructor of main page
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int r = 0;
  int g = 0;
  int b = 0;
  int maxValueOfColor = 255;
  int count = 1;
  Random rnd = Random();
  Color color = Colors.blueGrey;
  PointerMoveEvent event = const PointerMoveEvent();
  bool isRightButton = false;
  bool isShow = false;
  double top = 60.0;
  double left = 60.0;
  double sizeOfPointer = 60.0;

  Color? _getRandomColor() {
    setState(() {
    r = rnd.nextInt(maxValueOfColor);
    g = rnd.nextInt(maxValueOfColor);
    b = rnd.nextInt(maxValueOfColor);
    color = Color.fromARGB(maxValueOfColor, r, g, b);
    });

    return color;
  }

  void _startPushing() {
    setState(() {
      if (left > MediaQuery.of(context).size.width - sizeOfPointer * 2) {
        count = 1;
        left -= sizeOfPointer + sizeOfPointer * count;
      } else if (left < 0.0) {
        return;
      } else {
        count++;
        left = sizeOfPointer * count;
      }
      top = top == sizeOfPointer
          ? MediaQuery.of(context).size.height - sizeOfPointer : sizeOfPointer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (_) => isShow ? _ : _getRandomColor() ,
        onPointerMove: (event) {
          setState(() {
            this.event = event;
            isShow = true;
          });
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: color,
              alignment: Alignment.center,
              child: const Text(
                'Hey there',
                style: TextStyle(
                  fontSize: 34.0,
                  color: Colors.white,
                ),
              ),
            ),
            if (isShow && !isRightButton)
              Positioned(
                top: event.localPosition.dy - sizeOfPointer / 2,
                left: event.localPosition.dx - sizeOfPointer / 2,
                child: PointerWidget(
                  sizeOfPointer: sizeOfPointer,
                  onTap: () {
                    setState(() {
                      isRightButton = true;
                    });
                  },
                ),
              ),
            if (isRightButton)
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                top: top,
                left: left,
                child: PointerWidget(
                  onTap: () => _startPushing(),
                  sizeOfPointer: sizeOfPointer,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
