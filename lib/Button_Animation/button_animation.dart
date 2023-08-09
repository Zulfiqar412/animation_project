// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'dart:async';
import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:animation_project/Button_Animation/toggle_menu.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:slider_button/slider_button.dart';

import '../utils/app_const.dart';
import '../utils/appcolors.dart';
import '../utils/my_size.dart';
import '../widgets/text_widgets.dart';

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({super.key});

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;
  bool isTapped = false;
  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;
  bool isTapped1 = false;
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  late AnimationController aanimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    aanimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController.dispose();
    aanimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Button Animation",
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
              iconAnimation(
                  "Animated Button", Center(child: circleAnimatedButton())),
              const SizedBox(
                height: 20,
              ),
              iconAnimation(
                  "Animated Buttons",
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size10),
                    child: Center(child: animatedButtons()),
                  )),
              const SizedBox(
                height: 20,
              ),
              iconAnimation(
                  "Animated Button",
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size10),
                    child: Center(child: responsiveButton()),
                  )),
              const SizedBox(
                height: 20,
              ),
              iconAnimation(
                  "Animated Button",
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size10),
                    child: Center(child: simpleButton()),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.eef0f7Colr,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MySize.size12, top: MySize.size14),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Animation",
                                style: TextStyle(
                                    color: AppColors.five25fColor,
                                    fontSize: 20),
                              ),
                              Text(
                                "Foldable Button",
                                style: TextStyle(
                                    color: AppColors.seven277Color,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const FoldableOptions()
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              iconAnimation(
                  "Animated Button",
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size10),
                    child: Center(child: progressButton()),
                  )),
              const SizedBox(
                height: 20,
              ),
              iconAnimation(
                  "Animated Button",
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size10),
                    child: Center(child: rippleAnimationButton()),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(const ToggleMenu());
                },
                child: Container(
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.eef0f7Colr,
                  ),
                  child: const Center(
                    child: Text(
                      "Toggle Menu",
                      style: TextStyle(
                          color: AppColors.seven277Color, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              iconAnimation(
                  "Animated Button",
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size10),
                    child: Center(child: sliderButton()),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget sliderButton() {
    return SliderButton(
      height: 60,
      action: () {},
      label: const Text(
        'Slide to cancel Event',
        style: TextStyle(
            color: Color(0xff4a4a4a),
            fontWeight: FontWeight.w500,
            fontSize: 17),
      ),
      icon: const Text(
        'x',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 40,
        ),
      ),
      buttonColor: Colors.black,
    );
  }

  Widget rippleAnimationButton() {
    return AnimatedBuilder(
      animation: aanimationController,
      builder: (context, child) {
        return Container(
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: const CircleBorder(),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              8.0 * aanimationController.value,
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
    );
  }

  Widget progressButton() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: 'Send',
          icon: const Icon(Icons.send, color: Colors.white),
          color: Colors.deepPurple.shade500),
      ButtonState.loading:
          IconedButton(text: 'Loading', color: Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: 'Failed',
          icon: const Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: 'Success',
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400)
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(
              () {
                stateTextWithIcon = Random.secure().nextBool()
                    ? ButtonState.success
                    : ButtonState.fail;
              },
            );
          },
        );

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(
      () {
        stateTextWithIcon = stateTextWithIcon;
      },
    );
  }

  Widget foldableButton() {
    return AnimatedButton(
      color: Colors.blue,
      onPressed: () {},
      enabled: true,
      shadowDegree: ShadowDegree.light,
      child: const Text(
        'Simple button',
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget simpleButton() {
    return AnimatedButton(
      height: 45,
      child: const Text(
        'Simple button',
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      color: Colors.blue,
      onPressed: () {},
      enabled: true,
      shadowDegree: ShadowDegree.light,
    );
  }

  Widget responsiveButton() {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 35 : 40,
        width: isTapped ? 150 : 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(3, 7),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'TAP HERE',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }

  Widget circleAnimatedButton() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: () {
        setState(
          () {
            _arrowAnimationController.isCompleted
                ? _arrowAnimationController.reverse()
                : _arrowAnimationController.forward();
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 35 : 40,
        width: isTapped ? 35 : 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(5, 5),
            )
          ],
        ),
        child: AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: const Icon(
              Icons.expand_more,
              size: 30.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget animatedButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: AnimatedContainer(
            height: 40,
            width: 40,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isPressed ? 0.2 : 0.0),
                  blurRadius: 20,
                  offset: const Offset(5, 10),
                ),
              ],
              color: isPressed ? Colors.white : Colors.black.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite,
              color: isPressed
                  ? Colors.black.withOpacity(0.7)
                  : Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHighlightChanged: (value) {
            setState(() {
              isHighlighted = !isHighlighted;
            });
          },
          onTap: () {
            setState(() {
              isPressed2 = !isPressed2;
            });
          },
          child: AnimatedContainer(
            margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
            height: isHighlighted ? 40 : 35,
            width: isHighlighted ? 40 : 35,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(5, 10),
                ),
              ],
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: isPressed2
                ? Icon(
                    Icons.favorite_border,
                    color: Colors.black.withOpacity(0.6),
                  )
                : Icon(
                    Icons.favorite,
                    color: Colors.pink.withOpacity(1.0),
                  ),
          ),
        ),
      ],
    );
  }
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

class FoldableOptions extends StatefulWidget {
  const FoldableOptions({super.key});

  @override
  _FoldableOptionsState createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  final List<IconData> options = [
    Icons.settings,
    Icons.person,
    Icons.favorite,
    Icons.home,
    Icons.star,
  ];

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;
  late Animation<Alignment> fourthAnim;
  late Animation<Alignment> fifthAnim;
  late Animation<double> verticalPadding;
  late AnimationController controller;
  final duration = const Duration(milliseconds: 190);

  Widget getItem(IconData source) {
    const size = 45.0;
    return GestureDetector(
      onTap: () {
        controller.reverse();
      },
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Color(0XFFE95A8B),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Icon(
          source,
          color: Colors.white.withOpacity(1.0),
          size: 20,
        ),
      ),
    );
  }

  Widget buildPrimaryItem(IconData source) {
    const size = 45.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0XFFE95A8B),
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
              color: const Color(0XFFE95A8B).withOpacity(0.8),
              blurRadius: verticalPadding.value),
        ],
      ),
      child: Icon(
        source,
        color: Colors.white.withOpacity(1),
        size: 20,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);

    final anim = CurvedAnimation(parent: controller, curve: Curves.linear);
    firstAnim =
        Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topRight)
            .animate(anim);
    secondAnim =
        Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topLeft)
            .animate(anim);
    thirdAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.centerLeft)
        .animate(anim);
    fourthAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomLeft)
        .animate(anim);
    fifthAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomRight)
        .animate(anim);
    verticalPadding = Tween<double>(begin: 0, end: 26).animate(anim);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 200,
      margin: const EdgeInsets.only(right: 15),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: firstAnim.value,
                child: getItem(
                  options.elementAt(0),
                ),
              ),
              Align(
                alignment: secondAnim.value,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 37, top: verticalPadding.value),
                  child: getItem(
                    options.elementAt(1),
                  ),
                ),
              ),
              Align(
                alignment: thirdAnim.value,
                child: getItem(
                  options.elementAt(2),
                ),
              ),
              Align(
                  alignment: fourthAnim.value,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 38, bottom: verticalPadding.value),
                    child: getItem(
                      options.elementAt(3),
                    ),
                  )),
              Align(
                alignment: fifthAnim.value,
                child: getItem(
                  options.elementAt(4),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    controller.isCompleted
                        ? controller.reverse()
                        : controller.forward();
                  },
                  child: buildPrimaryItem(
                    controller.isCompleted || controller.isAnimating
                        ? Icons.close
                        : Icons.add,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
