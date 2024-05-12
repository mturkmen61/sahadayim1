import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.opacity = 1,
      this.buttonColor = AppColors.green})
      : super(key: key);
  final String text;
  final Function()? onPressed;
  final double opacity;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(88))),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16,
                color: buttonColor == AppColors.green
                    ? AppColors.white
                    : AppColors.green),
          ),
        ),
      ),
    );
  }
}
