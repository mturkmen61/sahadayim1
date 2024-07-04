import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/screens/main/home_screen_tab.dart';
import 'package:sahadayim/screens/profile/profile_card_screen.dart';

class HomeScreenController extends GetxController {
  int selectedIndex = 0;

  void changeTab(int index) {
    selectedIndex = index;
    update();
  }

  final List<Widget> pages = [
    const HomeScreenTab(),
    const Center(child: Text('Search')),
    const Center(child: Text('Notifications')),
    const Center(child: Text('Messages')),
    const ProfileCardScreen(),
  ];
}
