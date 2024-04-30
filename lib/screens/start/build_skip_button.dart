import 'package:flutter/material.dart';
import 'package:sahadayim/constants/colors.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Diğer sayfaya geçişi sağlayan buton
          if (currentPageIndex != 0)
            ElevatedButton(
              onPressed: () {
                backPage();
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: AppColors.greenColor,
                padding: const EdgeInsets.all(12.0),
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.whiteColor,
              ),
            ),
          const SizedBox(
            width: 20,
          ),
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
                print("Başka Sayfa Yok");
              } else {
                print(currentPageIndex);
                nextPage();
                print(currentPageIndex);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: AppColors.greenColor,
              padding: const EdgeInsets.all(12.0),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: AppColors.whiteColor,
            ),
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
      height: 2,
      color: AppColors.greenColor,
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
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.greenColor30,
      ),
    );
  }
}
