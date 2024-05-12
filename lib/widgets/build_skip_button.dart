import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/routes/routes.dart';

class BuildSkip extends StatelessWidget {
  const BuildSkip({
    super.key,
    required this.currentPageIndex,
    required this.nextPage,
    required this.backPage,
  });

  final int currentPageIndex;
  final Function nextPage;
  final Function backPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          if (currentPageIndex != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                currentPageIndex == 0
                    ? const BuildDotDivider()
                    : const BuildDot(),
                const SizedBox(width: 2),
                currentPageIndex == 1
                    ? const BuildDotDivider()
                    : const BuildDot(),
                const SizedBox(width: 2),
                currentPageIndex == 2
                    ? const BuildDotDivider()
                    : const BuildDot(),
              ],
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Diğer sayfaya geçişi sağlayan buton
              if (currentPageIndex != 0)
                TextButton(
                  onPressed: () {
                    backPage();
                  },
                  child: Text(
                    "Skip",
                    style: TextStyleHelper.green,
                  ),
                ),
              if (currentPageIndex == 0)
                Row(
                  children: [
                    currentPageIndex == 0
                        ? const BuildDotDivider()
                        : const BuildDot(),
                    const SizedBox(width: 2),
                    currentPageIndex == 1
                        ? const BuildDotDivider()
                        : const BuildDot(),
                    const SizedBox(width: 2),
                    currentPageIndex == 2
                        ? const BuildDotDivider()
                        : const BuildDot(),
                  ],
                ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (currentPageIndex == 2) {
                    backPage();
                  } else {
                    nextPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: currentPageIndex != 0
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Köşelerdeki yuvarlaklık
                          side: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0), // Kenarlık (opsiyonel)
                        )
                      : const CircleBorder(),
                  backgroundColor: AppColors.green,
                  padding: currentPageIndex != 0
                      ? const EdgeInsets.symmetric(horizontal: 45, vertical: 20)
                      : const EdgeInsets.all(16),
                ),
                child: currentPageIndex != 0
                    ? Text(
                        "Next",
                        style: TextStyleHelper.white,
                      )
                    : const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildDotDivider extends StatelessWidget {
  const BuildDotDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 3,
      color: AppColors.green,
    );
  }
}

class BuildDot extends StatelessWidget {
  const BuildDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.green30,
      ),
    );
  }
}
