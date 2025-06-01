import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/controllers/screens/home_screen_controller.dart';
import 'package:sahadayim/routes/routes.dart';

class ProfileCardScreen extends GetView<HomeScreenController> {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Profil",
            style: TextStyle(
                color: AppColors.darkGreen, fontFamily: "Lato", fontSize: 16),
          ),
          centerTitle: true,
          actions: [
            _editButton("Kartı Düzenle"),
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Center(
            child: Column(
              children: [
                Text(
                  "OYUNCU KARTIN",
                  style: TextStyleHelper.black4,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 40, right: 40),
                  child: Container(
                    width: Get.width * 0.8,
                    height: 545.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/images/grass_bc.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  controller.showModal(context);
                                },
                                child: Text(
                                  "1 Takım",
                                  style: TextStyleHelper.white4,
                                )),
                          ],
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xffDBEFE1), // Kenar rengi
                              width: 2, // Kenar kalınlığı
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            foregroundImage: AssetImage(AppImages.profile),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Ad Soyad (Yaş)',
                          textAlign: TextAlign.center,
                          style: TextStyleHelper.white1,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.green1,
                            ),
                            Text(
                              ' BAĞCILAR/ISTANBUL',
                              textAlign: TextAlign.center,
                              style: TextStyleHelper.white2,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Container(
                          height: 54.h,
                          width: double.infinity,
                          color: AppColors.green1,
                          child: TabBar(
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 2.0),
                              insets: EdgeInsets.symmetric(horizontal: 40.0),
                            ),
                            labelStyle: TextStyleHelper.green2,
                            tabs: const [
                              Tab(
                                text: 'Özellikler',
                              ),
                              Tab(text: 'Yorumlar'),
                              Tab(text: 'İlanlar'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Tab1Content(),
                              const Center(child: Text('Content of Tab 2')),
                              const Center(child: Text('Content of Tab 3')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _editButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.ProfileEditScreen);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: const Color(0xFFF1F1F1),
              width: 1.0,
            ),
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black, // Adjust the text color as needed
                fontSize: 16, // Adjust the font size as needed
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Tab1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(6, (index) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.black),
                const SizedBox(height: 8),
                Text(
                  'Item ${index + 1}',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
