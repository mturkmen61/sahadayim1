import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MatchToggleButton extends StatefulWidget {
  const MatchToggleButton(
      {Key? key,
        required this.onValueChanged,
        required this.button1Text,
        required this.button2Text})
      : super(key: key);
  final Function onValueChanged;
  final String button1Text;
  final String button2Text;

  @override
  State<MatchToggleButton> createState() => _MatchToggleButtonState();
}

class _MatchToggleButtonState extends State<MatchToggleButton> {
  int toggleValue = 0;
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl(
      initialValue: toggleValue,
      fixedWidth: 180,
      innerPadding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow()],
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(88),
          )),
      thumbDecoration: const BoxDecoration(
        color: AppColors.green,
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
        color: enabled ? AppColors.white : AppColors.darkGreen,
        fontSize: 14,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500),
  );
}
