import 'package:flutter/material.dart';

class BouncingTextAnimation extends StatefulWidget {
  const BouncingTextAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BouncingTextAnimationState createState() => _BouncingTextAnimationState();
}

class _BouncingTextAnimationState extends State<BouncingTextAnimation> {
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedDefaultTextStyle(
              style: animated
                  ? const TextStyle(
                      color: Colors.blue,
                      fontSize: 80,
                    )
                  : const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.elasticOut,
              child: const Text('bounce'),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  animated = !animated;
                });
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text("Animate"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
