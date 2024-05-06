import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton(
      {Key? key,
      required this.onValueChanged,
      required this.button1Text,
      required this.button2Text})
      : super(key: key);
  final Function onValueChanged;
  final String button1Text;
  final String button2Text;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  int toggleValue = 0;
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl(
      initialValue: toggleValue,
      fixedWidth: Get.width * 0.35,
      innerPadding: const EdgeInsets.all(4),
      height: 60,
      decoration: const BoxDecoration(
          color: AppColors.white,

          /// todo:tasarımdaki renk eklenecek
          borderRadius: BorderRadius.all(Radius.circular(88))),
      thumbDecoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(88)),
      ),
      children: {
        0: _buildText(widget.button1Text, toggleValue == 0),
        1: _buildText(widget.button2Text, toggleValue == 1)
      },
      onValueChanged: (value) {
        widget.onValueChanged(value);
        setState(() {
          toggleValue = value;
        });
      },
    );
  }

  /// Button Text
  Widget _buildText(String text, bool enabled) => Text(
        text,
        style: TextStyle(

            /// todo : taarım
            color: enabled ? AppColors.black : AppColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      );
}
