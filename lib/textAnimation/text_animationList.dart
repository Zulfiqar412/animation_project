// ignore_for_file: file_names

import 'package:animation_project/textAnimation/textScroll_animation.dart';
import 'package:animation_project/textAnimation/textanimation.dart';
import 'package:animation_project/textAnimation/wavy_text_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/listView_GridViewmodel.dart';
import '../utils/appcolors.dart';
import '../utils/my_size.dart';
import 'animated_text.dart';
import 'bouncing_text_animation.dart';
import 'fade_scale_animation.dart';
import 'fade_text_animation.dart';

class TextAnimationList extends StatefulWidget {
  const TextAnimationList({super.key});

  @override
  State<TextAnimationList> createState() => _TextAnimationListState();
}

class _TextAnimationListState extends State<TextAnimationList> {
  List<ListViewAndGridViewModel> text = [
    ListViewAndGridViewModel(
      text: "Animated Text",
    ),
    ListViewAndGridViewModel(
      text: "Wavy Text Animation",
    ),
    ListViewAndGridViewModel(
      text: "Text Scroll Animation",
    ),
    ListViewAndGridViewModel(
      text: "Fade Text Animation",
    ),
    ListViewAndGridViewModel(
      text: "Fade and Scale Text Animation",
    ),
    ListViewAndGridViewModel(
      text: "Text Animation",
    ),
    ListViewAndGridViewModel(
      text: "Bouncing Text Animation",
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
          "Bacground Animation",
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
                        text.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(top: MySize.size10),
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Get.to(const AnimatedText());
                                  }
                                  if (index == 1) {
                                    Get.to(const WavyTextAnimation());
                                  }
                                  if (index == 2) {
                                    Get.to(const TextScrollAnimation());
                                  }
                                  if (index == 3) {
                                    Get.to(const FadeTextAnimation());
                                  }
                                  if (index == 4) {
                                    Get.to(const FadeAndScaleTextAnimation());
                                  }
                                  if (index == 5) {
                                    Get.to(const TextAnimation());
                                  }
                                  if (index == 6) {
                                    Get.to(const BouncingTextAnimation());
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
                                              text[index].text,
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
