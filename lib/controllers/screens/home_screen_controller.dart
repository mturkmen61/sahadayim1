import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/screens/main/home_screen_tab.dart';

class HomeScreenController extends GetxController {
  int selectedIndex = 0;

  void changeTab(int index) {
    selectedIndex = index;
    update();
  }

  final List<Widget> pages = [
    HomeScreenTab(),
    Center(child: Text('Search')),
    Center(child: Text('Notifications')),
    Center(child: Text('Messages')),
    Center(child: Text('Profile')),
  ];
}
