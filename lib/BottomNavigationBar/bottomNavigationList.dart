// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/listView_GridViewmodel.dart';
import '../utils/appcolors.dart';
import '../utils/my_size.dart';
import 'bottomNavigation1.dart';
import 'bottomNavigation2.dart';
import 'bottomNavigation3.dart';
import 'bottomNavigation4.dart';
import 'bottomNavigation5.dart';
import 'bottomNavigation6.dart';

class BottomNavigationList extends StatefulWidget {
  const BottomNavigationList({super.key});

  @override
  State<BottomNavigationList> createState() => _BottomNavigationListState();
}

class _BottomNavigationListState extends State<BottomNavigationList> {
  List<ListViewAndGridViewModel> bottom = [
    ListViewAndGridViewModel(
      text: "BottomNavigationBar1",
    ),
    ListViewAndGridViewModel(
      text: "BottomNavigationBar2",
    ),
    ListViewAndGridViewModel(
      text: "BottomNavigationBar3",
    ),
    ListViewAndGridViewModel(
      text: "BottomNavigationBar4",
    ),
    ListViewAndGridViewModel(
      text: "BottomNavigationBar5",
    ),
    ListViewAndGridViewModel(
      text: "BottomNavigationBar6",
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
          "BottomNavigation",
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
                        bottom.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(top: MySize.size10),
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Get.to(const BottomNavigation1());
                                  }
                                  if (index == 1) {
                                    Get.to(const BottomNavigation2());
                                  }
                                  if (index == 2) {
                                    Get.to(const BottomNavigation3());
                                  }
                                  if (index == 3) {
                                    Get.to(const BottomNavigation4());
                                  }
                                  if (index == 4) {
                                    Get.to(const BottomNavigation5());
                                  }
                                  if (index == 5) {
                                    Get.to(const BottomNavigation6());
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
                                              bottom[index].text,
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
