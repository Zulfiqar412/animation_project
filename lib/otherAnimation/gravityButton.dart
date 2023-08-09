// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GravityButton extends StatefulWidget {
  const GravityButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GravityButtonState createState() => _GravityButtonState();
}

class _GravityButtonState extends State<GravityButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isTapped = !isTapped;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.only(bottom: isTapped ? 0 : 400),
                duration: const Duration(seconds: 1),
                curve: isTapped ? Curves.bounceOut : Curves.ease,
                height: 150,
                width: 220,
                decoration: BoxDecoration(
                  color: const Color(0xffFF4E4E),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 10,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    isTapped ? Icons.arrow_downward : Icons.arrow_upward,
                    color: Colors.white,
                    size: 35,
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
