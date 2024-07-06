import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProgressButton extends StatefulWidget {
  const ProgressButton({Key? key, required this.onTap, required this.progress})
      : super(key: key);
  final Function() onTap;
  final double progress;
  @override
  State<ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: widget.progress,
              strokeWidth: 10.0,
              color: AppColors.green.withOpacity(0.4),
            ),
          ),
          InkWell(
            onTap: () {
              widget.onTap();
            },
            child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: InkWell(
                    child: Icon(Icons.arrow_forward_outlined,
                        color: AppColors.green))),
          ),
        ]),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
