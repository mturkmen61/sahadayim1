import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StartScreenController extends GetxController {
  int currentPageIndex = 0; // Başlangıçta gösterilecek sayfa indeksi

  void nextPage() {
    // Bir sonraki sayfaya geçmek için indeksi artır
    currentPageIndex++;
    update();
  }

  void backPage() {
    // Bir sonraki sayfaya geçmek için indeksi artır
    currentPageIndex--;
    update();
  }
}
