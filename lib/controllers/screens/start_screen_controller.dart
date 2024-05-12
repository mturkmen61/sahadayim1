import 'package:get/get.dart';
import 'package:sahadayim/routes/routes.dart';

class StartScreenController extends GetxController {
  int currentPageIndex = 0; // Başlangıçta gösterilecek sayfa indeksi
  void nextPage() {
    // Bir sonraki sayfaya geçmek için indeksi artır
    currentPageIndex++;
    update();
  }

  void backPage() {
    // Bir sonraki sayfaya geçmek için indeksi artır
    //currentPageIndex--;
    Get.offAllNamed(Routes.profileScreen);
    update();
  }
}
