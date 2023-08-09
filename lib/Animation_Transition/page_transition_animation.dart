import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../fade_transition/fade_transition.dart';
import '../page_transition_switcher.dart';
import '../scale_transition/scale_transition.dart';
import '../size_transition/size_transition.dart';
import '../slide_transition.dart';
import '../utils/app_const.dart';
import '../utils/appcolors.dart';
import '../utils/my_size.dart';
import '../widgets/text_widgets.dart';
import 'animation_transition.dart';

class PageTransitionAnimation extends StatefulWidget {
  const PageTransitionAnimation({super.key});

  @override
  State<PageTransitionAnimation> createState() =>
      _PageTransitionAnimationState();
}

class _PageTransitionAnimationState extends State<PageTransitionAnimation>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Get.to(const AnimationTransition());
            Timer(
              const Duration(milliseconds: 300),
              () {
                scaleController.reset();
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 10.0).animate(scaleController);
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Page Tramsition Animation",
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
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MySize.scaleFactorHeight * 144,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.eef0f7Colr),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: MySize.size16, top: MySize.size15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Animation",
                            fontSize: MySize.size16,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.seven277Color,
                          ),
                          TextWidget(
                            text: "Open Container",
                            fontSize: MySize.size16,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.five25fColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MySize.size10),
                        child: Center(
                          child: OpenContainer(
                            closedBuilder: (_, openContainer) {
                              return SizedBox(
                                height: 80,
                                width: 80,
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: openContainer,
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              );
                            },
                            openColor: Colors.white,
                            closedElevation: 50.0,
                            closedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            closedColor: Colors.white,
                            openBuilder: (_, closeContainer) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.blue,
                                  title: const Text('Go back'),
                                  leading: IconButton(
                                    onPressed: closeContainer,
                                    icon: const Icon(Icons.arrow_back,
                                        color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size15,
              ),
              Container(
                height: MySize.scaleFactorHeight * 144,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.eef0f7Colr),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: MySize.size16, top: MySize.size15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Animation",
                            fontSize: MySize.size16,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.seven277Color,
                          ),
                          TextWidget(
                            text: "Animating Transition",
                            fontSize: MySize.size16,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.five25fColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MySize.size15),
                        child: InkWell(
                          onTap: () {
                            scaleController.forward();
                          },
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: AnimatedBuilder(
                                animation: scaleAnimation,
                                builder: (c, child) => Transform.scale(
                                  scale: scaleAnimation.value,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const FadeTransitions());
                },
                child: Container(
                  height: MySize.scaleFactorHeight * 144,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.eef0f7Colr),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size16, top: MySize.size15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Animation",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.seven277Color,
                            ),
                            TextWidget(
                              text: "Fade Transition",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.five25fColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const SizeTransitions());
                },
                child: Container(
                  height: MySize.scaleFactorHeight * 144,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.eef0f7Colr),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size16, top: MySize.size15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Animation",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.seven277Color,
                            ),
                            TextWidget(
                              text: "Size Transition",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.five25fColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const ScaleTransitions());
                },
                child: Container(
                  height: MySize.scaleFactorHeight * 144,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.eef0f7Colr),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size16, top: MySize.size15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Animation",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.seven277Color,
                            ),
                            TextWidget(
                              text: "Scale Transition",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.five25fColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const PageTransitionSwitchers());
                },
                child: Container(
                  height: MySize.scaleFactorHeight * 144,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.eef0f7Colr),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size16, top: MySize.size15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Animation",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.seven277Color,
                            ),
                            TextWidget(
                              text: "Page Transition Switcher",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.five25fColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const SlideTransitions());
                },
                child: Container(
                  height: MySize.scaleFactorHeight * 144,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.eef0f7Colr),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size16, top: MySize.size15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Animation",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.seven277Color,
                            ),
                            TextWidget(
                              text: "Slide Animation",
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.five25fColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
