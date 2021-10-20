import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/screen/add/add_screen.dart';
import 'package:flutter_shop_practice/screen/over_view/over_view_screen.dart';
import 'package:flutter_shop_practice/screen/setting_screen/setting_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainScreen extends StatelessWidget {
  static const routName = 'mainScreen';

  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      OverViewScreen(),
      AddScreen(),
      SettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {


    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("بازی ها"),
          textStyle:
              TextStyle(color: Colors.white, fontFamily: 'bold', fontSize: 14),
          activeColorPrimary: Theme.of(context).scaffoldBackgroundColor,
          inactiveColorPrimary: Theme.of(context).scaffoldBackgroundColor,
          activeColorSecondary: Theme.of(context).primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.add_circle),
          title: ("افزودن بازی"),
          textStyle:
              TextStyle(color: Colors.white, fontFamily: 'bold', fontSize: 14),
          activeColorPrimary: Theme.of(context).scaffoldBackgroundColor,
          inactiveColorPrimary: Theme.of(context).scaffoldBackgroundColor,
          activeColorSecondary: Theme.of(context).primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_rounded),
          title: ("تنظیمات"),
          textStyle:
              TextStyle(color: Colors.white, fontFamily: 'bold', fontSize: 14),
          activeColorPrimary: Theme.of(context).scaffoldBackgroundColor,
          inactiveColorPrimary: Theme.of(context).scaffoldBackgroundColor,
          activeColorSecondary: Theme.of(context).primaryColor,
        ),
      ];
    }

    Future<bool> _willPopCallback() async => false;
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,

        backgroundColor: Theme.of(context).primaryColor,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
          ),
          colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.once,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style10, // Choose the nav bar style with this property.
      ),
    );
  }
}
