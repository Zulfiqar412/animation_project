import 'package:flutter/material.dart';
import 'dart:math' as math;

class Background2 extends StatefulWidget {
  const Background2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Background2State createState() => _Background2State();
}

class _Background2State extends State<Background2>
    with SingleTickerProviderStateMixin {
  double radius = 0.0;
  double gap = 10.0;
  late Animation<double> _animation;
  late AnimationController ac;

  @override
  void initState() {
    super.initState();
    ac = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    ac.forward();

    ac.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ac.reset();
      } else if (status == AnimationStatus.dismissed) {
        ac.forward();
      }
    });
  }

  @override
  void dispose() {
    ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 0.0, end: gap).animate(ac)
      ..addListener(() {
        setState(() {
          radius = _animation.value;
        });
      });

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: CircleWavePainter(radius),
      ),
    );
  }
}

class CircleWavePainter extends CustomPainter {
  final double radius;
  // ignore: prefer_typing_uninitialized_variables
  var wavePaint;

  CircleWavePainter(this.radius) {
    wavePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double X = size.width / 2.0;
    double Y = size.height / 2.0;
    double maxRadius = logic(X, Y);

    var currentRadius = radius;
    while (currentRadius < maxRadius) {
      canvas.drawCircle(Offset(X, Y), currentRadius, wavePaint);
      currentRadius += 10.0;
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.radius != radius;
  }

  double logic(double x, double y) {
    return math.sqrt(x * x + y * y);
  }
}
