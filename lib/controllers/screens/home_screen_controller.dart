import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/screens/main/home_screen_tab.dart';
import 'package:sahadayim/screens/profile/profile_card_screen.dart';
import 'package:sahadayim/widgets/primary_button.dart';

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

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Takımların',
                    style: TextStyleHelper.black2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Şu an 1 Takımın var',
                    style: TextStyleHelper.black5,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.green, // Kenar rengi
                            width: 2, // Kenar kalınlığı
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xffC9F881),
                        ),
                      ),
                      title: Text(
                        "FIFA",
                        style: TextStyleHelper.black6,
                      ),
                      subtitle: Text("Defansif Orta Saha",
                          style: TextStyleHelper.green2),
                      trailing: Text("Adalar", style: TextStyleHelper.grey2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                      text: "Geri Dön",
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
