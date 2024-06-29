import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:sahadayim/controllers/screens/profile_summary_screen_controller.dart';
import 'package:sahadayim/routes/routes.dart';

class ProfileSummaryScreen extends GetView<ProfileScreenController> {
  const ProfileSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Image.asset(
            AppImages.logo,
            width: 54,
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.h, top: 20.h),
                child: Stack(
                  children: [
                    Container(
                      width: Get.width * 0.78,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: AppColors.green),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              children: [
                                Chip(
                                  label: Text('Bitirici'),
                                  backgroundColor: AppColors.green1,
                                ),
                                Chip(
                                  label: Text('Bitirici'),
                                  backgroundColor: AppColors.green1,
                                ),
                                Chip(
                                  label: Text('Bitirici'),
                                  backgroundColor: AppColors.green1,
                                ),
                                Chip(
                                  label: Text('Duran Top'),
                                  backgroundColor: AppColors.green1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Container(
                            height: Get.height * 0.15,
                            width: double.infinity,
                            color: AppColors.green1,
                            child: Text(
                              textAlign: TextAlign.center,
                              "Takım Yok",
                              style: TextStyleHelper.green,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 80.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.asset(AppImages.leftShoe),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "Sol",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16.w,
              bottom: 46.h,
              child: Image.asset(
                AppImages.ball,
                width: 188,
                height: 168,
              ),
            ),
            Positioned(right: 10.w, bottom: 28.h, child: buildSkipButton()),
          ],
        ),
      );
    });
  }
}

Widget buildSkipButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(),
      CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: InkWell(
              onTap: () {},
              child: const Icon(Icons.arrow_forward_outlined,
                  color: AppColors.green))),
    ],
  );
}
