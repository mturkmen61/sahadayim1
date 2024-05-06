import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.textStyle})
      : super(key: key);
  final String text;
  final Function()? onTap;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
