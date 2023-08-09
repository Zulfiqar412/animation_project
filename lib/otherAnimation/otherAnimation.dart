// ignore_for_file: file_names

import 'package:animation_project/otherAnimation/physics_card.dart';
import 'package:animation_project/otherAnimation/slidableCard.dart';
import 'package:animation_project/otherAnimation/slimy_card.dart';
import 'package:animation_project/otherAnimation/switch.dart';
import 'package:animation_project/otherAnimation/tinderCards.dart';
import 'package:animation_project/otherAnimation/wiping_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/listView_GridViewmodel.dart';
import '../utils/appcolors.dart';
import '../utils/my_size.dart';
import 'animated_switch.dart';
import 'dragable_card.dart';
import 'expand_widget.dart';
import 'expanded_letter.dart';
import 'fade_scale.dart';
import 'gravityButton.dart';

class OtherAnimation extends StatefulWidget {
  const OtherAnimation({super.key});

  @override
  State<OtherAnimation> createState() => _OtherAnimationState();
}

class _OtherAnimationState extends State<OtherAnimation> {
  List<ListViewAndGridViewModel> other = [
    ListViewAndGridViewModel(
      text: "Tinder Cards",
    ),
    ListViewAndGridViewModel(
      text: "Slimy Card",
    ),
    ListViewAndGridViewModel(
      text: "Slidable Card",
    ),
    ListViewAndGridViewModel(
      text: "Expand Widget",
    ),
    ListViewAndGridViewModel(
      text: "Fade Scale Transition",
    ),
    ListViewAndGridViewModel(
      text: "Switch Button",
    ),
    ListViewAndGridViewModel(
      text: "Gravity Button",
    ),
    ListViewAndGridViewModel(
      text: "Animated Switch Button",
    ),
    ListViewAndGridViewModel(
      text: "Dragable Card",
    ),
    ListViewAndGridViewModel(
      text: "Physics Card",
    ),
    ListViewAndGridViewModel(
      text: "Expanded Letter",
    ),
    ListViewAndGridViewModel(
      text: "Swiping Card",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: MySize.size90,
        centerTitle: true,
        title: Text(
          "Home Animation",
          style: GoogleFonts.quicksand(
              fontSize: MySize.size20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Column(
                children: [
                  SizedBox(
                    height: MySize.size20,
                  ),
                  Wrap(
                    children: List.generate(
                        other.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(top: MySize.size10),
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Get.to(const TCardPage());
                                  }
                                  if (index == 1) {
                                    Get.to(const SlimyCard());
                                  }
                                  if (index == 2) {
                                    Get.to(const SlidableCard());
                                  }
                                  if (index == 3) {
                                    Get.to(const ExpandWidget());
                                  }
                                  if (index == 4) {
                                    Get.to(const FadeScale());
                                  }
                                  if (index == 5) {
                                    Get.to(const SwitchButton());
                                  }
                                  if (index == 6) {
                                    Get.to(const GravityButton());
                                  }
                                  if (index == 7) {
                                    Get.to(const AnimatedSwicth());
                                  }
                                  if (index == 8) {
                                    Get.to(const DragableCard());
                                  }
                                  if (index == 9) {
                                    Get.to(const PhysicsCard());
                                  }

                                  if (index == 10) {
                                    Get.to(const ExpandedLetter());
                                  }
                                  if (index == 11) {
                                    Get.to(const SwipingCard());
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: MySize.size10),
                                  height: MySize.size80,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: AppColors.eef0f7Colr),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          height: MySize.size36,
                                          width: MySize.size48,
                                          decoration: const BoxDecoration(
                                              color: AppColors.five25fColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(11),
                                                  bottomRight:
                                                      Radius.circular(11))),
                                          child: Center(
                                            child: Text(
                                              "New",
                                              style: GoogleFonts.inter(
                                                  fontSize: MySize.size12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/image_1__8_-removebg-preview 1.png",
                                              fit: BoxFit.cover,
                                              height:
                                                  MySize.scaleFactorHeight * 63,
                                              width:
                                                  MySize.scaleFactorWidth * 63,
                                            ),
                                            SizedBox(
                                              width: MySize.size14,
                                            ),
                                            Text(
                                              other[index].text,
                                              style: GoogleFonts.inter(
                                                  fontSize: MySize.size16,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.five25fColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: -10,
                                        bottom: 0,
                                        top: 0,
                                        child: Container(
                                          height: MySize.size40,
                                          width: MySize.size40,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.five25fColor),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: MySize.size20,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
