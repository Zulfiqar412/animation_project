import 'package:animation_project/utils/app_const.dart';
import 'package:animation_project/utils/appcolors.dart';
import 'package:animation_project/utils/my_size.dart';
import 'package:animation_project/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlideTransitions extends StatefulWidget {
  const SlideTransitions({super.key});

  @override
  State<SlideTransitions> createState() => _SlideTransitionsState();
}

class _SlideTransitionsState extends State<SlideTransitions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Slide Animation",
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
                    context, SlideTransition1(const SecondPage())),
                child: const Text('TAP TO VIEW SLIDE ANIMATION 1')),
          ),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, SlideTransition2(const SecondPage())),
              child: const Text('TAP TO VIEW SLIDE ANIMATION 2')),
        ],
      ),
    );
  }
}

class SlideTransition1 extends PageRouteBuilder {
  final Widget page;

  SlideTransition1(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                child: page,
              );
            });
}

class SlideTransition2 extends PageRouteBuilder {
  final Widget page;

  SlideTransition2(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.rtl,
                child: page,
              );
            });
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Slide Transition'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
