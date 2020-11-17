import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/UI/ElfatihaUI.dart';
import 'package:quran/UI/HomePage.dart';
import 'package:quran/UI/sorahPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  int i= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: CupertinoTabBar(
          currentIndex: i,
          onTap: (int v){
            pageController.animateToPage(
                i,
                duration: Duration(
                    microseconds: 400
                ),
                curve: Curves.bounceInOut
            );
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: (int v){
          setState(() {
            i = v;
          });
        },
        controller: pageController,
        children: [
          SorahPage(),
          HomePage(),
          ElfatihaUI(),

        ],
      ),
    );
  }
}
