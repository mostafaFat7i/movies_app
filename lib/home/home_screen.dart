import 'package:flutter/material.dart';
import 'package:movies_app/home/browse_tab/browse_tab_screen.dart';
import 'package:movies_app/home/home_tab/home_tab_screen.dart';
import 'package:movies_app/home/search_tab/search_tab_screen.dart';
import 'package:movies_app/home/watchit_tab/watchit_tab_screen.dart';
import 'package:movies_app/theme/my_theme.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: MyTheme.widgetColor),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Color(0xFFC6C6C6),
          selectedItemColor: MyTheme.goldColor,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/browse.png')),
              label: 'BROWSE',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/watchit.png')),
              label: 'WATCHLIST',
            ),
          ],
        ),
      ),

      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [HomeTabScreen(), SearchTabScreen(), BrowseTabScreen(), WatchitTabScreen()];

}

