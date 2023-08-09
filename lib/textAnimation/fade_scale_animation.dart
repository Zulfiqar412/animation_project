import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FadeAndScaleTextAnimation extends StatefulWidget {
  const FadeAndScaleTextAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FadeAndScaleTextAnimationState createState() =>
      _FadeAndScaleTextAnimationState();
}

class _FadeAndScaleTextAnimationState extends State<FadeAndScaleTextAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'Fade First',
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ScaleAnimatedText(
              'Then Scale',
              textStyle: const TextStyle(
                fontSize: 70,
                fontFamily: 'Canterbury',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
