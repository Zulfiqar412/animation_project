// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home6 extends StatefulWidget {
  const Home6({super.key});

  @override
  _Home6State createState() => _Home6State();
}

class _Home6State extends State<Home6> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FB),
        appBar: AppBar(
          elevation: 20,
          shadowColor: const Color(0xffF0F0F0).withOpacity(.4),
          backgroundColor: Colors.white,
          title: Text(
            '   Your App\'s Name',
            textScaleFactor: 1.12,
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black.withOpacity(.7),
              tooltip: 'Settings',
              enableFeedback: true,
              icon: Icon(
                CupertinoIcons.gear_alt_fill,
                color: Colors.black.withOpacity(.7),
              ),
              onPressed: () {
                HapticFeedback.lightImpact();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => settingsPage()));
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.black.withOpacity(.8),
            unselectedLabelStyle:
                TextStyle(color: Colors.black.withOpacity(.5)),
            unselectedLabelColor: Colors.black.withOpacity(.4),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black.withOpacity(.8),
            tabs: [
              const Tab(
                child: Text(
                  'EXAMPLE',
                ),
              ),
              const Tab(
                child: Text(
                  'EXAMPLE',
                ),
              ),
              const Tab(
                child: Text(
                  'EXAMPLE',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            mainCardWidget(context),
            mainCardWidget(context),
            mainCardWidget(context),
          ],
        ),
      ),
    );
  }
}

Widget mainCardWidget(BuildContext context) {
  return ListView(
    physics:
        const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    children: [
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      cardWithInfoPage('assets/images/file_name.png', 'Example', context),
      SizedBox(
        height: MediaQuery.of(context).size.width / 7,
      ),
    ],
  );
}

Widget cardWithInfoPage(String image, String name, BuildContext context) {
  return cardWidget(
    context,
    infoPage(name, context),
    name,
    image,
  );
}

Widget cardWidget(
    BuildContext context, Widget route, String name, String image) {
  double _w = MediaQuery.of(context).size.width;
  double _f = MediaQuery.of(context).textScaleFactor;
  return InkWell(
    enableFeedback: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      HapticFeedback.lightImpact();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return route;
          },
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 30),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.fromLTRB(_w / 20, _w / 20, _w / 20, 0),
      height: _w / 5,
      padding: EdgeInsets.all(_w / 25),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _w / 2.0,
              // color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: _f * 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(.8),
                    ),
                  ),
                  Text(
                    'Tap to know more',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: _f * 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // height: _w / 5.5,
              width: _w / 3.3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0),
                color: Colors.black.withOpacity(.2),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1), blurRadius: 30),
                ],
                // image: DecorationImage(
                //     image: AssetImage(image), fit: BoxFit.cover),
              ),
              child: const Center(
                child: Text(
                  'Add image here',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget infoPage(String name, BuildContext context) {
  double _f = MediaQuery.of(context).textScaleFactor;
  return Scaffold(
    backgroundColor: const Color(0xffF8F9FB),
    appBar: AppBar(
      leading: IconButton(
        tooltip: 'Back',
        icon: Icon(
          CupertinoIcons.chevron_back,
          color: Colors.black.withOpacity(.7),
        ),
        onPressed: () {
          HapticFeedback.lightImpact();
          Navigator.maybePop(context);
        },
      ),
      shadowColor: const Color(0xffF0F0F0).withOpacity(.4),
      elevation: 20,
      backgroundColor: Colors.white,
      title: Text(
        name,
        style: TextStyle(
          color: Colors.black.withOpacity(.7),
          fontSize: _f * 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          color: Colors.black.withOpacity(.7),
          tooltip: 'Settings',
          enableFeedback: true,
          icon: const Icon(CupertinoIcons.gear_alt_fill),
          onPressed: () {
            HapticFeedback.lightImpact();
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        ),
      ],
    ),
  );
}
