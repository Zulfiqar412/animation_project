// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';
import 'package:get/get.dart';

class SlimyCard extends StatefulWidget {
  const SlimyCard({super.key});

  @override
  _SlimyCardState createState() => _SlimyCardState();
}

class _SlimyCardState extends State<SlimyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          FlutterSlimyCard(
            topCardHeight: 160,
            bottomCardHeight: 120,
            topCardWidget: topWidget(),
            bottomCardWidget: bottomWidget(),
          ),
        ],
      ),
    ));
  }

  topWidget() {
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 75,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/download.jpg'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'A Horse',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  bottomWidget() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: const Column(
          children: [
            SizedBox(height: 10),
            Flexible(
                child: Text(
              'A horse is a large animal which people can ride. Some horses are used for pulling ploughs and carts. Say Hello to a Funny Hourse.',
              style: TextStyle(color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
