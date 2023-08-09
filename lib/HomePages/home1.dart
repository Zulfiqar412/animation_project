// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

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

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
      body: Stack(
        children: [
          // background color
          const backgroundColor(),

          /// ListView
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            reverse: true,
            children: [
              SizedBox(height: w / 6.5),
              groupOfCards(
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
              ),
              groupOfCards(
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
              ),
              groupOfCards(
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
              ),
              groupOfCards(
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
              ),
              groupOfCards(
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
                'Example Text',
                Icons.favorite,
                const RouteWhereYouGo(),
              ),
              SizedBox(height: w / 10),
            ],
          ),

          /// blurTheStatusBar
          const blurTheStatusBar(),

          /// AppBar
          const bottomAppBar(),
        ],
      ),
    );
  }

  Widget groupOfCards(String title1, IconData icon1, Widget route1,
      String title2, IconData icon2, Widget route2) {
    double w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: Padding(
          padding: EdgeInsets.only(bottom: w / 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              card(
                title: title1,
                icon: icon1,
                route: route1,
                key: UniqueKey(),
              ),
              card(title: title2, icon: icon2, route: route2, key: UniqueKey()),
            ],
          ),
        ),
      ),
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  const RouteWhereYouGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: const Text(
          'EXAMPLE  PAGE',
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}

class backgroundColor extends StatelessWidget {
  const backgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffF583A5), Color(0xffF43FBB)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}

class blurTheStatusBar extends StatelessWidget {
  const blurTheStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class bottomAppBar extends StatelessWidget {
  const bottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              height: w / 6.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: w / 18),
                          Text(
                            'App\'s name',
                            style: TextStyle(
                              fontSize: w / 17,
                              color: Colors.white.withOpacity(1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            tooltip: 'Settings',
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white.withOpacity(1),
                              size: w / 18,
                            ),
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RouteWhereYouGo();
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(width: w / 50)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class card extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget route;

  const card(
      {required Key key,
      required this.title,
      required this.icon,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: w / 2.1,
      width: w / 2.4,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          HapticFeedback.lightImpact();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border:
                  Border.all(color: Colors.white.withOpacity(.06), width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: w / 7,
                  height: w / 7,
                  alignment: Alignment.center,
                  decoration:
                      // BoxDecoration(color: Colors.black.withOpacity(.04), shape: BoxShape.circle),
                      BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          shape: BoxShape.circle),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: w / 14,
                  ),
                ),
                Text(
                  title,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.9),
                    fontSize: w / 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    wordSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
