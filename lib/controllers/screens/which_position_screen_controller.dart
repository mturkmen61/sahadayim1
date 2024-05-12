import 'package:get/get.dart';

enum Mevki {
  kaleci,
  solBek,
  stoper1,
  stoper2,
  sagBek,
  ortaSaha1,
  ortaSaha2,
  onLibero,
  forvet1,
  santrafor,
  forvet2,
}

class WhichPositionController extends GetxController {
  int x = 0;

  String mevkiGetir(int index) {
    if (index < 0 || index >= Mevki.values.length) {
      throw ArgumentError('Geçersiz indeks: $index');
    }

    return Mevki.values[index].toString().substring(5);
  }
}
