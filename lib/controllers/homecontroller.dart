import 'package:get_x/get.dart';

class HomeController extends GetxController {
  bool startChat = false;
  int bottomIndex = 0;

  void changeBottomIndex(int index) {
    bottomIndex = index;
    update();
  }
}
