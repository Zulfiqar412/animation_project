// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              searchBar(),
              SizedBox(height: w / 20),
              groupOfCards(
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo(),
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo()),
              groupOfCards(
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo(),
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo()),
              groupOfCards(
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo(),
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo()),
              groupOfCards(
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo(),
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo()),
              groupOfCards(
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo(),
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo()),
              groupOfCards(
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo(),
                  'Example Text',
                  'Example Text',
                  'assets/images/file_name.png',
                  const RouteWhereYouGo()),
            ],
          ),
          settingIcon(),
        ],
      ),
    );
  }

  Widget settingIcon() {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, w / 10, w / 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: w / 8.5,
            width: w / 8.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              tooltip: 'Settings',
              icon: Icon(Icons.settings,
                  size: w / 17, color: Colors.black.withOpacity(.6)),
              onPressed: () {
                Navigator.of(context).push(
                  MyFadeRoute(
                    route: const RouteWhereYouGo(),
                    page: Container(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 20, w / 25, w / 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: w / 8.5,
            width: w / 1.36,
            padding: EdgeInsets.symmetric(horizontal: w / 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontWeight: FontWeight.w600,
                    fontSize: w / 22),
                prefixIcon:
                    Icon(Icons.search, color: Colors.black.withOpacity(.6)),
                hintText: 'Search anything.....',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(height: w / 14),
          SizedBox(
            width: w / 1.15,
            child: Text(
              'Example Text',
              textScaleFactor: 1.4,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget groupOfCards(
      String title1,
      String subtitle1,
      String image1,
      Widget route1,
      String title2,
      String subtitle2,
      String image2,
      Widget route2) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 20, 0, w / 20, w / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          card(title1, subtitle1, image1, route1),
          card(title2, subtitle2, image2, route2),
        ],
      ),
    );
  }

  Widget card(String title, String subtitle, String image, Widget route) {
    double w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context)
              .push(MyFadeRoute(route: route, page: Container()));
        },
        child: Container(
          width: w / 2.36,
          height: w / 1.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: w / 2.36,
                height: w / 2.6,
                decoration: const BoxDecoration(
                  color: Color(0xff5C71F3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Add image here',
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Image.asset(
              //   image,
              //   fit: BoxFit.cover,
              //   width: _w / 2.36,
              //   height: _w / 2.6),
              Container(
                height: w / 6,
                width: w / 2.36,
                padding: EdgeInsets.symmetric(horizontal: w / 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1.4,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      textScaleFactor: 1,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  MyFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class RouteWhereYouGo extends StatelessWidget {
  const RouteWhereYouGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('EXAMPLE  PAGE',
            style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 1)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }
}
