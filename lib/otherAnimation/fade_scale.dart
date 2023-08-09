// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeScale extends StatefulWidget {
  const FadeScale({super.key});

  @override
  _FadeScaleState createState() => _FadeScaleState();
}

class _FadeScaleState extends State<FadeScale>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        value: 0.0,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 250),
        vsync: this)
      ..addStatusListener((status) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _BlahBlah {
    switch (_controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeScaleTransition(
                    animation: _controller, child: child);
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (_BlahBlah) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              child: Container(
                height: 55,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    _BlahBlah ? 'HIDE' : 'SHOW',
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
