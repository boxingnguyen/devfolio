import 'package:flutter/material.dart';

class FuncVsClassAnimated extends StatefulWidget {
  const FuncVsClassAnimated({Key? key}) : super(key: key);

  @override
  State<FuncVsClassAnimated> createState() => _FuncVsClassAnimatedState();
}

class _FuncVsClassAnimatedState extends State<FuncVsClassAnimated> {
  bool showCircle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: showCircle ? Circle() : Square(),
              // Uncomment to break the animation
//               child: showCircle ? circle() : square(),
            ),
            TextButton(
              onPressed: () => setState(() => showCircle = !showCircle),
              child: const Text(
                'Click me to do a fade transition between square and a circle',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}

Widget square() {
  return Container(
    width: 50,
    height: 50,
    color: Colors.red,
  );
}

class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 50,
      height: 50,
      child: const Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        color: Colors.red,
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}

Widget circle() {
  // ignore: sized_box_for_whitespace
  return Container(
    width: 50,
    height: 50,
    child: const Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      color: Colors.red,
      clipBehavior: Clip.hardEdge,
    ),
  );
}
