// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TextScrollAnimation extends StatefulWidget {
  const TextScrollAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextScrollAnimationState createState() => _TextScrollAnimationState();
}

class _TextScrollAnimationState extends State<TextScrollAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Marquee(
        text: 'There once was a boy who told this story about a boy: "',
        style: const TextStyle(fontSize: 20),
        fadingEdgeStartFraction: 0.2,
        fadingEdgeEndFraction: 0.2,
        blankSpace: 50,
      ),
    );
  }
}



//    Try it.
//
// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }
//
// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Marquee(
//         text: 'Some sample text that takes some space.',
//         style: TextStyle(fontWeight: FontWeight.bold),
//         scrollAxis: Axis.horizontal,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.end,
//         blankSpace: 20.0,
//         velocity: 100.0,
//         pauseAfterRound: Duration(seconds: 1),
//         startPadding: 10.0,
//         accelerationDuration: Duration(seconds: 1),
//         accelerationCurve: Curves.linear,
//         decelerationDuration: Duration(milliseconds: 500),
//         decelerationCurve: Curves.easeOut,
//       ),
//     );
//   }
// }