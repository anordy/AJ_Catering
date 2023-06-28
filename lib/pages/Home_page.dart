import 'package:aj_catering/pages/screen/home_screen.dart';
import 'package:aj_catering/pages/screen/order_screen.dart';
import 'package:aj_catering/pages/screen/profile_screen.dart';
import 'package:aj_catering/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool isAuth = false;
  String accessToken = "";
  _loadUsers() async {
    setState(() {});
  }

 late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // backgroundColor: AppColor.bgScreen,
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(this.isAuth),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColor.base, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0.0),
            colorBehindNavBar: Colors.black,
            border: Border.all(color: const Color(0xFFD9D0E3))),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens(bool isAuth) {
    return [ HomeScreen(), const OrderScreen(), const ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.grid_view),
          title: ("Home"),
          activeColorPrimary: AppColor.base,
          inactiveColorPrimary: const Color(0xFF000000),
          onPressed: (val) {
            _controller.jumpToTab(0);
          }),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.check_mark),
          title: ("Order"),
          activeColorPrimary: AppColor.base,
          inactiveColorPrimary: const Color(0xFF000000),
          onPressed: (val) {
            _controller.jumpToTab(1);
          }),
          
             
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.card_giftcard_outlined),
          title: ("Profile"),
          activeColorPrimary: AppColor.base,
          inactiveColorPrimary: const Color(0xFF000000),
          onPressed: (a) {
            _controller.jumpToTab(4);
          }),
    ];
  }

}
