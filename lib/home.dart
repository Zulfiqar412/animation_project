// ignore_for_file: must_be_immutable

import 'package:animation_project/Animation_Transition/page_transition_animation.dart';
import 'package:animation_project/BottomNavigationBar/bottomNavigationList.dart';
import 'package:animation_project/Button_Animation/button_animation.dart';
import 'package:animation_project/HomePages/home_page_list.dart';
import 'package:animation_project/LoginPages/login_pages_list.dart';
import 'package:animation_project/SplashScreen/splash_screen_list.dart';
import 'package:animation_project/backgroundAnimation/backGroundAnimation.dart';
import 'package:animation_project/customPainterAnimation/customPainter.dart';
import 'package:animation_project/icon_animation.dart';
import 'package:animation_project/listView_gridView/listView_griView.dart';
import 'package:animation_project/loop_animation.dart';
import 'package:animation_project/otherAnimation/otherAnimation.dart';
import 'package:animation_project/textAnimation/text_animationList.dart';
import 'package:animation_project/utils/app_const.dart';
import 'package:animation_project/utils/appcolors.dart';
import 'package:animation_project/utils/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/home_page_model.dart';
import 'navigationDrawer/navigationDrawer.dart';
import 'widgets/text_widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<HomeModel> prokitItems = [
    HomeModel(
      image: AppConst.h1,
      title: "Icon Animation",
      subTitle: "12",
      isCheck: true,
    ),
    HomeModel(
      image: AppConst.h2,
      title: "Loop Animation",
      subTitle: "12",
      isCheck: false,
    ),
    HomeModel(
      image: AppConst.h3,
      title: "Page Transition",
      subTitle: "12",
      isCheck: true,
    ),
    HomeModel(
      image: AppConst.h4,
      title: "Button Animation",
      subTitle: "12",
      isCheck: false,
    ),
    HomeModel(
      image: AppConst.h5,
      title: "ListandGrid",
      subTitle: "12",
      isCheck: true,
    ),
    HomeModel(
      image: AppConst.h6,
      title: "BottomNavigation",
      subTitle: "12",
      isCheck: true,
    ),
    HomeModel(
      image: AppConst.h7,
      title: "Back Animation",
      subTitle: "12",
      isCheck: false,
    ),
    HomeModel(
      image: AppConst.h8,
      title: "Text Animation",
      subTitle: "12",
      isCheck: false,
    ),
    HomeModel(
      image: AppConst.h9,
      title: "Splash Animation",
      subTitle: "12",
      isCheck: true,
    ),
    HomeModel(
      image: AppConst.h10,
      title: "Login",
      subTitle: "12",
      isCheck: true,
    ),
    HomeModel(
      image: AppConst.h11,
      title: "Home",
      subTitle: "12",
      isCheck: false,
    ),
    HomeModel(
      image: AppConst.h12,
      title: "CustomPainter",
      subTitle: "12",
      isCheck: true,
    ),
    HomeModel(
      image: AppConst.h13,
      title: "NavigationDrawer",
      subTitle: "12",
      isCheck: false,
    ),
    HomeModel(
      image: AppConst.h14,
      title: "Other Animation",
      subTitle: "12",
      isCheck: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.backColor,
      appBar: AppBar(
        title: TextWidget(
          text: "Flutter Animation Gallery",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: prokitItems.length,
              padding: EdgeInsets.symmetric(
                  horizontal: MySize.scaleFactorWidth * 15),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MySize.scaleFactorWidth * 16,
                  mainAxisSpacing: MySize.scaleFactorHeight * 20,
                  childAspectRatio: 1.2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(const IconAnimation());
                      break;
                    case 1:
                      Get.to(const LoopAnimation());
                      break;
                    case 2:
                      Get.to(const PageTransitionAnimation());
                      break;
                    case 3:
                      Get.to(const ButtonAnimation());
                      break;
                    case 4:
                      Get.to(const ListViewAndGridView());
                      break;
                    case 5:
                      Get.to(const BottomNavigationList());
                      break;
                    case 6:
                      Get.to(const BackgroundAnimation());
                      break;
                    case 7:
                      Get.to(const TextAnimationList());
                      break;
                    case 8:
                      Get.to(const SplashScreenList());
                      break;
                    case 9:
                      Get.to(const LoginPagesList());
                      break;
                    case 10:
                      Get.to(const HomePageList());
                      break;
                    case 11:
                      Get.to(const CustomPainterAnimationPage());
                      break;
                    case 12:
                      Get.to(const NavDrawer());
                      break;
                    case 13:
                      Get.to(const OtherAnimation());
                      break;
                  }
                },
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MySize.size16),
                          color: AppColors.cardColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MySize.scaleFactorHeight * 70,
                            width: MySize.scaleFactorWidth * 100,
                            child: Image.asset(
                              prokitItems[index].image!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: MySize.scaleFactorHeight * 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: prokitItems[index].title!,
                                fontSize: MySize.size16,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.darkSecondry,
                              ),
                              SizedBox(
                                width: MySize.scaleFactorWidth * 4,
                              ),
                              TextWidget(
                                text: '(${prokitItems[index].subTitle!})',
                                fontSize: MySize.size12,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.darkSecondry,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    prokitItems[index].isCheck!
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: MySize.scaleFactorHeight * 28,
                              width: MySize.scaleFactorWidth * 36,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(MySize.size12),
                                    bottomRight: Radius.circular(MySize.size12),
                                  ),
                                  color: AppColors.secondaryColor),
                              child: Center(
                                child: TextWidget(
                                  text: "New",
                                  fontSize: MySize.size10,
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
