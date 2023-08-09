import 'dart:math';

import 'package:animation_project/utils/appcolors.dart';
import 'package:animation_project/utils/my_size.dart';
import 'package:animation_project/widgets/text_widgets.dart';
import 'package:animator/animator.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'model/icon_animation_model.dart';
import 'utils/app_const.dart';

class LoopAnimation extends StatefulWidget {
  const LoopAnimation({super.key});

  @override
  State<LoopAnimation> createState() => _LoopAnimationState();
}

class _LoopAnimationState extends State<LoopAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 13.0).animate(_animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    _animationController.dispose();
    _animationController.dispose();
    _animation.isDismissed;
    super.dispose();
  }

  List<IconAnimationModel> icon = [
    IconAnimationModel(
      text: "Ripple Animation",
    ),
    IconAnimationModel(text: "Glow Animation"),
    IconAnimationModel(text: "Tween Animation"),
    IconAnimationModel(text: "Elevation Animation"),
    IconAnimationModel(text: "Ripple Animation Button"),
    IconAnimationModel(text: "Floating Icon Animation"),
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: "Loop Animation",
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
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              iconAnimation(
                  "Ripple Animation",
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: MySize.size26),
                      child: CustomPaint(
                        painter: MyCustomPainter(
                          _animation.value,
                        ),
                        child: Container(),
                      ),
                    ),
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Glow Animation",
                  Center(
                      child: AvatarGlow(
                    glowColor: Colors.black,
                    endRadius: 36,
                    duration: const Duration(milliseconds: 2000),
                    repeat: true,
                    showTwoGlows: true,
                    curve: Curves.easeOutQuad,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(99)),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                  ))),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Tween Anaimation",
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Animator<double>(
                        duration: const Duration(milliseconds: 1500),
                        cycles: 0,
                        curve: Curves.easeInOut,
                        tween: Tween<double>(begin: 0.0, end: 15.0),
                        builder: (context, animatorState, child) => Container(
                          margin: EdgeInsets.all(animatorState.value),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFF5757),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFF5757).withOpacity(0.5),
                                offset: const Offset(0, 5),
                                blurRadius: 30,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Spinning Moon",
                  Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: _animation.value + _animation.value,
                            spreadRadius: _animation.value,
                            offset: Offset(_animation.value, _animation.value),
                          ),
                        ],
                      ),
                      child: Icon(Icons.favorite,
                          color: Colors.pink.withOpacity(0.7), size: 30),
                    ),
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Ripple Animation",
                  Center(
                    child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Container(
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.5),
                            shape: const CircleBorder(),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              8.0 * animationController.value,
                            ),
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.blue,
                          icon: const Icon(
                            Icons.calendar_today,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Floating Action Icon",
                  Center(
                    child: SizedBox(
                      height: MySize.scaleFactorHeight * 76,
                      width: w / 4,
                      child: Animator<double>(
                        duration: const Duration(milliseconds: 1000),
                        cycles: 0,
                        curve: Curves.easeInOut,
                        tween: Tween<double>(begin: 0.0, end: 10.0),
                        builder: (context, animatorState, child) => Column(
                          children: [
                            SizedBox(height: animatorState.value * 1),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(.15),
                                    blurRadius: 20,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: MySize.size20,
              ),
            ]),
          ),
        ));
  }

  Widget iconAnimation(
    String text,
    Widget iconWidget,
  ) {
    return Container(
      height: MySize.scaleFactorHeight * 144,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.eef0f7Colr),
      child: Padding(
        padding: EdgeInsets.only(left: MySize.size16, top: MySize.size15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "Animation",
              fontSize: MySize.size16,
              fontWeight: FontWeight.w500,
              textColor: AppColors.seven277Color,
            ),
            TextWidget(
              text: text,
              fontSize: MySize.size16,
              fontWeight: FontWeight.w700,
              textColor: AppColors.five25fColor,
            ),
            iconWidget
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double animationValue;

  MyCustomPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (int value = 3; value >= 0; value--) {
      circle(
          canvas, Rect.fromLTRB(0, 0, size.width, 10), value + animationValue);
    }
  }

  void circle(Canvas canvas, Rect rect, double value) {
    Paint paint = Paint()
      ..color =
          const Color(0xff19DC7C).withOpacity((1 - (value / 2)).clamp(.0, 1));

    canvas.drawCircle(rect.center,
        sqrt((rect.width * .3 * rect.width * .3) * value / 9), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return true;
  }
}
