import 'package:animation_project/utils/app_const.dart';
import 'package:animation_project/utils/appcolors.dart';
import 'package:animation_project/utils/my_size.dart';
import 'package:animation_project/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tweener/tweener.dart';

import 'model/icon_animation_model.dart';

class IconAnimation extends StatefulWidget {
  const IconAnimation({super.key});

  @override
  State<IconAnimation> createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with TickerProviderStateMixin {
  bool expanded = true;
  late AnimationController controller;
  double _counter = 0;

  bool tap = true;
  bool show = true;
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  bool isTapped = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    );
    _heartAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        reverseDuration: const Duration(milliseconds: 400));
    _heartAnimation = Tween(
      begin: 50.0,
      end: 60.0,
    ).animate(CurvedAnimation(
        curve: Curves.elasticOut,
        reverseCurve: Curves.ease,
        parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _heartAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _heartAnimationController.dispose();
  }

  List<IconAnimationModel> icon = [
    IconAnimationModel(
      text: "Heart Beat Animation",
    ),
    IconAnimationModel(text: "Animated Icons"),
    IconAnimationModel(text: "Responsive Icon"),
    IconAnimationModel(text: "Animating Icon"),
    IconAnimationModel(text: "controllable Heart Beat Animation"),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Icon Animation",
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
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              iconAnimation(
                  "Heart Beat Animation",
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: width / 9,
                        width: width / 5,
                        child: Animator<double>(
                          duration: const Duration(milliseconds: 1000),
                          cycles: 0,
                          curve: Curves.elasticIn,
                          tween: Tween<double>(begin: 20.0, end: 25.0),
                          builder: (context, animatorState, child) => Icon(
                            Icons.favorite,
                            size: animatorState.value * 3,
                            color: const Color(0xFFFF5757),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width / 9,
                        width: width / 6,
                        child: Animator<double>(
                          duration: const Duration(milliseconds: 1000),
                          cycles: 0,
                          curve: Curves.elasticIn,
                          tween: Tween<double>(begin: 20.0, end: 25.0),
                          builder: (context, animatorState, child) => Icon(
                            Icons.favorite,
                            size: animatorState.value * 3,
                            color: const Color(0xFFFF5757),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width / 9,
                        width: width / 7,
                        child: Animator<double>(
                          duration: const Duration(milliseconds: 1000),
                          cycles: 0,
                          curve: Curves.elasticIn,
                          tween: Tween<double>(begin: 20.0, end: 25.0),
                          builder: (context, animatorState, child) => Icon(
                            Icons.favorite,
                            size: animatorState.value * 3,
                            color: const Color(0xFFFF5757),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Animated Icons",
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: AnimatedIcon(
                                icon: AnimatedIcons.view_list,
                                size: MySize.size30,
                                progress: controller),
                            onPressed: () {
                              setState(() {
                                expanded
                                    ? controller.forward()
                                    : controller.reverse();
                                expanded = !expanded;
                              });
                            }),
                        IconButton(
                            icon: AnimatedIcon(
                                icon: AnimatedIcons.pause_play,
                                size: MySize.size30,
                                progress: controller),
                            onPressed: () {
                              setState(() {
                                expanded
                                    ? controller.forward()
                                    : controller.reverse();
                                expanded = !expanded;
                              });
                            }),
                        IconButton(
                            icon: AnimatedIcon(
                                icon: AnimatedIcons.menu_close,
                                size: MySize.size30,
                                progress: controller),
                            onPressed: () {
                              setState(() {
                                expanded
                                    ? controller.forward()
                                    : controller.reverse();
                                expanded = !expanded;
                              });
                            }),
                      ],
                    ),
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Responsive Icon",
                  Center(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onHighlightChanged: (value) {
                        tap = !value;
                        show = false;
                        if (tap == true) {
                          Tweener({'x': 20})
                              .to({'x': 40}, 500)
                              .easing(Ease.linear.easeIn)
                              .onUpdate((obj) {
                                setState(() {
                                  _counter = (obj['x']).round() * 1.0;
                                });
                              })
                              .onComplete((obj) {})
                              .start();
                        } else {
                          Tweener(
                            {'x': 40},
                          )
                              .to({'x': 20}, 200)
                              .easing(Ease.linear.easeIn)
                              .onUpdate((obj) {
                                setState(() {
                                  _counter = (obj['x']).round() * 1.0;
                                });
                              })
                              .onComplete((obj) {})
                              .start();
                        }
                      },
                      onTap: () {
                        show = false;
                      },
                      child: AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 1500),
                        height: tap ? 60 : 40,
                        width: tap ? 60 : 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF5757),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xFFFF5757).withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: 30)
                            ]),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: show ? 40 : _counter,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Animating Icons",
                  Center(
                    child: SizedBox(
                      height: width / 7,
                      width: width / 2.7,
                      child: Animator<double>(
                        duration: const Duration(milliseconds: 1000),
                        cycles: 0,
                        curve: Curves.easeInOut,
                        tween: Tween<double>(begin: 15.0, end: 25.0),
                        builder: (context, animatorState, child) => Icon(
                          Icons.audiotrack,
                          size: animatorState.value * 3,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: MySize.size15,
              ),
              iconAnimation(
                  "Contrallable Heart Beat Animation",
                  AnimatedBuilder(
                    animation: _heartAnimationController,
                    builder: (context, child) {
                      return Center(
                        child: AnimatedBuilder(
                          animation: _heartAnimationController,
                          builder: (context, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.favorite,
                                    color: Colors.red,
                                    size: _heartAnimation.value),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: MySize.size3,
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          _heartAnimationController.forward(),
                                      child: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.darkSecondry),
                                        child: Center(
                                          child: Text(
                                            'Start beating',
                                            style: GoogleFonts.raleway(
                                                color: AppColors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          _heartAnimationController.stop(),
                                      child: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.darkSecondry),
                                        child: Center(
                                          child: Text(
                                            'stop beating',
                                            style: GoogleFonts.raleway(
                                                color: AppColors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
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
