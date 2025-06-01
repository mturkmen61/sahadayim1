import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahadayim/routes/routes.dart';

class contactScreen extends StatefulWidget {
  const contactScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<contactScreen> {
  final TextEditingController _matchTimeController = TextEditingController();

  String? _selectedDistrict;
  String? _selectedFieldName;
  String? _selectedTimeRange;
  bool _isDistrictValid = true;
  bool _isFieldNameValid = true;
  bool _isTimeRangeValid = true;

  @override
  void dispose() {
    _matchTimeController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() {
      _isDistrictValid = _selectedDistrict != null;
      _isFieldNameValid = _selectedFieldName != null;
      _isTimeRangeValid = _selectedTimeRange != null;
    });

    if (_isDistrictValid && _isFieldNameValid && _isTimeRangeValid) {
      Get.snackbar(
        "Başarılı",
        "Eşleşme sağlandı!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      // Navigate to the next screen if needed
      Get.toNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "İLETİŞİM SAYFASI",
            style: TextStyle(
                color: AppColors.darkGreen, fontFamily: "Lato", fontSize: 16),
          ),
          centerTitle: true,

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 22),
              _buildContactScreenText(),
              const SizedBox(height: 20),
              _buildPhoneNumberText(),
              const SizedBox(height: 20),
              const Text(
                "İletişim Bilgileri",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.darkGreen,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildDistrictDropdown(),
              const SizedBox(height: 10),
              _buildDropdownField(),
              const SizedBox(height: 10),
              _buildTimeRangeDropdown(),
              const SizedBox(height: 20),
              buildSubmitButton(),
            ],
          ),
        ),
      );
    });
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

  Widget _buildContactScreenText() {
    return const Center(
      child: Text(
        "Eşleşme sağlanması için aşağıdaki bilgileri girmeniz gerekiyor. Aşağıda rakip takım kaptanının telefon numarası bulunmaktadır. Onunla whatsapp üzerinden iletişime geçebilirsiniz.",
        style: TextStyle(
          fontSize: 15,
          color: AppColors.green,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDistrictDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "İlçe",
        labelStyle: const TextStyle(color: AppColors.darkGreen),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
        errorText: !_isDistrictValid ? 'Lütfen ilçeyi seçin.' : null,
      ),
      value: _selectedDistrict,
      onChanged: (String? newValue) {
        setState(() {
          _selectedDistrict = newValue;
        });
      },
      items: <String>['Üsküdar', 'Kadıköy']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Saha İsmi",
        labelStyle: const TextStyle(color: AppColors.darkGreen),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
        errorText: !_isFieldNameValid ? 'Lütfen saha ismini seçin.' : null,
      ),
      value: _selectedFieldName,
      onChanged: (String? newValue) {
        setState(() {
          _selectedFieldName = newValue;
        });
      },
      items: <String>['Uçar Halı Saha', 'Şampiyon Halı Saha']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildTimeRangeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Maç Saati",
        labelStyle: const TextStyle(color: AppColors.darkGreen),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
        errorText: !_isTimeRangeValid ? 'Lütfen maç saati aralığını seçin.' : null,
      ),
      value: _selectedTimeRange,
      onChanged: (String? newValue) {
        setState(() {
          _selectedTimeRange = newValue;
        });
      },
      items: <String>[
        '09:00 - 10:00', '10:00 - 11:00', '11:00 - 12:00', '12:00 - 13:00',
        '13:00 - 14:00', '14:00 - 15:00', '15:00 - 16:00', '16:00 - 17:00',
        '17:00 - 18:00', '18:00 - 19:00', '19:00 - 20:00', '20:00 - 21:00',
        '21:00 - 22:00', '22:00 - 23:00', '23:00 - 00:00', '00:00 - 01:00',
        '01:00 - 02:00', '02:00 - 03:00', '03:00 - 04:00'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildSubmitButton() {
    return Center(
      child: InkWell(
        onTap: _handleSubmit,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Text(
            "Eşleş!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "tel no: 1232131321",
        style: TextStyle(
          fontSize: 15,
          color: AppColors.green,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
