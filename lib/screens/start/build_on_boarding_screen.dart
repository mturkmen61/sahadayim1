import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/strings.dart';
import 'package:sahadayim/constants/styles.dart';

class BuildOnBoardingPage extends StatefulWidget {
  const BuildOnBoardingPage({
    super.key,
  });

  @override
  State<BuildOnBoardingPage> createState() => _BuildOnBoardingPageState();
}

class _BuildOnBoardingPageState extends State<BuildOnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Image.asset(AppImages.logo),
          //SvgPicture.asset('assets/images/football_player.svg'),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 375.w,
                  height: 425.h,
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    AppImages.backGround, // Arkaplan resmi adresi
                    width: 376.w,
                    height: 375.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  child: Image.asset(
                    AppImages.footballPlayer, // Üstteki resim adresi
                    width: 400.w,
                    height: 380.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Center(
                  child: Text(
                AppString.loremIpsum,
                textAlign: TextAlign.center,
                style: TextStyleHelper.black1,
              )),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    AppString.loremIpsumDolor,
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.grey1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
