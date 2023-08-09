// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

List<Color> colors = [
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.amber,
  Colors.cyan,
  Colors.purple,
  Colors.brown,
  Colors.teal,
];

List<Widget> cards = List.generate(
  colors.length,
  (int index) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors[index],
      ),
      child: Text(
        '${index + 1}',
        style: const TextStyle(fontSize: 100.0, color: Colors.white),
      ),
    );
  },
);

class TCardPage extends StatefulWidget {
  const TCardPage({super.key});

  @override
  _TCardPageState createState() => _TCardPageState();
}

class _TCardPageState extends State<TCardPage> {
  final TCardController _controller = TCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 200),
            TCard(
              cards: cards,
              controller: _controller,
              onForward: (index, info) {
                setState(() {});
              },
              onBack: (index, info) {
                setState(() {});
              },
              onEnd: () {},
            ),
          ],
        ),
      ),
    );
  }
}
