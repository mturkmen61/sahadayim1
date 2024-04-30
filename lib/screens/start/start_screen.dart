import 'package:flutter/material.dart';
import 'package:sahadayim/screens/start/build_skip_button.dart';
import 'package:sahadayim/screens/start/start_screen1.dart';
import 'package:sahadayim/screens/start/start_screen3.dart';
import 'package:sahadayim/screens/start/start_screen_2.dart';

class StartPage1 extends StatefulWidget {
  const StartPage1({super.key});

  @override
  State<StartPage1> createState() => _StartPage1State();
}

class _StartPage1State extends State<StartPage1> {
  int currentPageIndex = 0; // Başlangıçta gösterilecek sayfa indeksi

  void nextPage() {
    setState(() {
      // Bir sonraki sayfaya geçmek için indeksi artır
      currentPageIndex++;
    });
  }

  void backPage() {
    setState(() {
      // Bir sonraki sayfaya geçmek için indeksi artır
      currentPageIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentPageIndex,
              children: const [
                BuildOnBoardingPage1(),
                BuildOnBoardingPage2(),
                BuildOnBoardingPage3(), // İlk sayfa
                // Diğer sayfalar buraya eklenebilir
              ],
            ),
          ),
          BuildSkip(
            currentPageIndex: currentPageIndex,
            nextPage: nextPage,
            backPage: backPage,
          ),
        ],
      ),
    );
  }
}
