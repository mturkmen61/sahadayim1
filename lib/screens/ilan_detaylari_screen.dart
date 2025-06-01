import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/routes/routes.dart'; // Import the routes

class IlanDetaylariScreen extends StatefulWidget {
  const IlanDetaylariScreen({super.key});

  @override
  _IlanDetaylariScreenState createState() => _IlanDetaylariScreenState();
}

class _IlanDetaylariScreenState extends State<IlanDetaylariScreen> {
  String? _selectedTime;
  String? _selectedCity;
  String? _selectedDistrict;
  String? _selectedNeighborhood;
  String? _selectedFieldName;
  String? _selectedOyuncu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "ilanlar",
          style: TextStyle(
              color: AppColors.darkGreen, fontFamily: "Lato", fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'İlan için Bir kategori seç',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
                  fontFamily: 'Inter'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            buildDropdownButton(
                'Maçın Saati', _selectedTime, ['10:00', '12:00', '14:00'],
                    (value) {
                  setState(() {
                    _selectedTime = value;
                  });
                }),
            buildDropdownButton(
                'Şehir', _selectedCity, ['İstanbul', 'Ankara', 'İzmir'],
                    (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                }),
            buildDropdownButton(
                'İlçe', _selectedDistrict, ['Kadıköy', 'Beşiktaş', 'Çankaya'],
                    (value) {
                  setState(() {
                    _selectedDistrict = value;
                  });
                }),
            buildDropdownButton('Mahalle', _selectedNeighborhood,
                ['Merkez', 'Kuzey Mah.', 'Güney Mah.'], (value) {
                  setState(() {
                    _selectedNeighborhood = value;
                  });
                }),
            buildDropdownButton(
                'Saha İsmi', _selectedFieldName, ['Saha 1', 'Saha 2', 'Saha 3'],
                    (value) {
                  setState(() {
                    _selectedFieldName = value;
                  });
                }),
            buildDropdownButton('Oyuncu/Kaleci', _selectedOyuncu, [
              'Oyuncu',
              'Kaleci',
            ], (value) {
              setState(() {
                _selectedOyuncu = value;
              });
            }),
            const Spacer(),
            buildIlanVerButton(),
          ],
        ),
      ),
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

  Widget buildIlanVerButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          Get.snackbar(
            "Başarılı",
            "İlan verildi!",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          // Navigate to the next screen if needed
          Get.toNamed(Routes.home);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        ),
        child: const Text(
          'İlan Ver',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCircularIcon(String assetName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFF1F1F1), // Adjust the color as needed
            width: 1.0, // 1-pixel border width
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            assetName,
            fit: BoxFit.scaleDown,
            width: 24, // Adjust the width and height as needed
            height: 24,
          ),
        ),
      ),
    );
  }
}
