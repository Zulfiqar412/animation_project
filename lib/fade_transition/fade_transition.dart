import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_const.dart';
import '../utils/appcolors.dart';
import '../utils/my_size.dart';
import '../widgets/text_widgets.dart';

class FadeTransitions extends StatefulWidget {
  const FadeTransitions({super.key});

  @override
  State<FadeTransitions> createState() => _FadeTransitionsState();
}

class _FadeTransitionsState extends State<FadeTransitions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Fade Traansition Animation",
          fontSize: MySize.size20,
          fontWeight: FontWeight.w600,
          textColor: AppColors.textColor,
        ),
        actions: [
          Image.asset(
            AppConst.settingsIcon,
            height: MySize.size20,
            width: MySize.size20,
          ),
          SizedBox(
            width: MySize.scaleFactorWidth * 20,
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context, FadeRoute1(const SecondPage())),
                  child: const Text('TAP TO VIEW FADE ANIMATION 1')),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, FadeRoute2(const SecondPage())),
              child: const Text('TAP TO VIEW FADE ANIMATION 2'),
            ),
          ]),
    );
  }
}

class FadeRoute1 extends PageRouteBuilder {
  final Widget page;

  FadeRoute1(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: page,
          ),
        );
}

class FadeRoute2 extends PageRouteBuilder {
  final Widget page;

  FadeRoute2(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return FadeTransition(
              opacity: animation,
              child: page,
            );
          },
        );
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fade Transition'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
