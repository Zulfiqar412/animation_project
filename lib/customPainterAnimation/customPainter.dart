// ignore_for_file: file_names

import 'package:animation_project/customPainterAnimation/spinner_loading.dart';
import 'package:animation_project/customPainterAnimation/splash_ripple_effect.dart';
import 'package:animation_project/customPainterAnimation/wifi.dart';
import 'package:animation_project/utils/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_const.dart';
import '../utils/appcolors.dart';
import '../widgets/text_widgets.dart';
import 'bounce_ripple_animation.dart';
import 'circular_loading_button.dart';
import 'loading_animation.dart';
import 'loading_button.dart';

class CustomPainterAnimationPage extends StatefulWidget {
  const CustomPainterAnimationPage({super.key});

  @override
  State<CustomPainterAnimationPage> createState() =>
      _CustomPainterAnimationPageState();
}

class _CustomPainterAnimationPageState extends State<CustomPainterAnimationPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Custom Painter Animation",
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
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              customPainterAnimation(
                "Wifi Symbol Animation",
                const Wifi(),
              ),
              const SizedBox(
                height: 20,
              ),
              customPainterAnimation(
                "Loading Button",
                const LoadingButton(),
              ),
              const SizedBox(
                height: 20,
              ),
              customPainterAnimation(
                "Circular Loading Button",
                const CircularLoadingButton(),
              ),
              const SizedBox(
                height: 20,
              ),
              customPainterAnimation(
                "Loading Animation",
                const LoadingAnimation(),
              ),
              const SizedBox(
                height: 20,
              ),
              customPainterAnimation(
                "Spinner Loading",
                const SpinnerLoading(),
              ),
              const SizedBox(
                height: 20,
              ),
              customPainterAnimation(
                "Bounce Ripple Animation",
                const BounceRippleAnimation(),
              ),
              const SizedBox(
                height: 20,
              ),
              customPainterAnimation(
                "Splash Ripple Effect",
                Padding(
                  padding: EdgeInsets.only(right: MySize.size50),
                  child: const SplashRippleEffect(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customPainterAnimation(
    String text,
    Widget iconWidget,
  ) {
    return Container(
      height: MySize.scaleFactorHeight * 144,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.eef0f7Colr),
      child: Padding(
        padding: EdgeInsets.only(left: MySize.size16, right: MySize.size16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            iconWidget
          ],
        ),
      ),
    );
  }
}
