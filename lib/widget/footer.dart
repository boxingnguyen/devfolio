import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class Footer extends StatelessWidget with Utils {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      child: Center(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'Developed by ',
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                      text: 'Flutter ',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => openURL("https://flutter.dev/")),
                  const TextSpan(text: 'with '),
                  const TextSpan(
                    text: '💙',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Inspired by ",
                ),
                InkWell(
                  onTap: () => openURL("https://github.com/mhmzdev/DevFolio"),
                  child: const Text(
                    "Hamza ",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const InkWell(
                  child: Text("with respect."),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
