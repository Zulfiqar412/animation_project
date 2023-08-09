import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_const.dart';
import '../utils/appcolors.dart';
import '../utils/my_size.dart';
import '../widgets/text_widgets.dart';

class ScaleTransitions extends StatefulWidget {
  const ScaleTransitions({super.key});

  @override
  State<ScaleTransitions> createState() => _ScaleTransitionsState();
}

class _ScaleTransitionsState extends State<ScaleTransitions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Scale Transition Animation",
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context, ScaleTransition1(const SecondPage())),
                child: const Text('TAP TO VIEW SCALE ANIMATION 1')),
          ),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, ScaleTransition2(const SecondPage())),
              child: const Text('TAP TO VIEW SCALE ANIMATION 2')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, ScaleTransition3(const SecondPage())),
              child: const Text('TAP TO VIEW SCALE ANIMATION 3')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, ScaleTransition4(const SecondPage())),
              child: const Text('TAP TO VIEW SCALE ANIMATION 4')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, ScaleTransition5(const SecondPage())),
              child: const Text('TAP TO VIEW SCALE ANIMATION 5')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, ScaleTransition6(const SecondPage())),
              child: const Text('TAP TO VIEW SCALE ANIMATION 6')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, ScaleTransition7(const SecondPage())),
              child: const Text('TAP TO VIEW SCALE ANIMATION 7')),
        ],
      ),
    );
  }
}

class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.bottomCenter,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition2 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition2(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.topCenter,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition3 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition3(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.bottomLeft,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition4 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition4(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.bottomRight,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition5 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition6 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition6(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.centerRight,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition7 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition7(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.centerLeft,
              scale: animation,
              child: child,
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
        title: const Text('Scale Transition'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
