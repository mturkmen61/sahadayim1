import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:sahadayim/routes/routes.dart';
import 'package:sahadayim/screens/google_maps_screen.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/ilVeİlceler.dart';
import '../widgets/progress_button.dart';

class KonumSecScreen extends StatefulWidget {
  const KonumSecScreen({Key? key}) : super(key: key);

  @override
  State<KonumSecScreen> createState() => _KonumSecScreenState();
}

class _KonumSecScreenState extends State<KonumSecScreen> {
  String? selectedIl;
  String? selectedIlce;
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          GoogleMapsScreen(location: selectedLocation),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  AppImages.logo,
                  width: 75,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.45,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.white.withOpacity(0.75),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        _buildKonumSecText(),
                        const SizedBox(height: 25),
                        buildDropdownButton(
                            'İl seçin',
                            selectedIl,
                            ilVeIlceler.keys.map((String il) {
                              return il;
                            }).toList(), (String? newValue) {
                          setState(() {
                            selectedIl = newValue;
                            selectedIlce =
                                null; // İl değişince ilçe de sıfırlanır
                          });
                        }),
                        buildDropdownButton(
                            'İlçe seçin',
                            selectedIlce,
                            selectedIl != null
                                ? ilVeIlceler[selectedIl]!.map((ilce) {
                                    return ilce['name'] as String;
                                  }).toList()
                                : [], (String? newValue) {
                          setState(() {
                            selectedIlce = newValue;
                            selectedLocation = ilVeIlceler[selectedIl]!
                                .firstWhere((ilce) =>
                                    ilce['name'] == newValue)['latLng'];
                          });
                        }),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25, right: 20),
                    child: ProgressButton(
                      onTap: () {
                        Get.toNamed(Routes.profileSummary);
                      },
                      progress: 0.75,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    });
  }

  /// Konum Seç text
  Widget _buildKonumSecText() {
    return const Text(
      "Maç Yapmak İstediğin Bölgeyi Seç",
      style: TextStyle(
          fontSize: 18,
          color: AppColors.green,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter'),
    );
  }

  Widget buildDropdownButton(String hint, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(35),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              hint,
              style: const TextStyle(
                  fontFamily: 'Inter', fontSize: 14, color: AppColors.black),
            ),
            value: value,
            isExpanded: true,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: AppColors.black),
                ),
              );
            }).toList(),
            icon: const ImageIcon(
              AssetImage(AppImages.arrow),
            ),
          ),
        ),
      ),
    );
  }
}
