import 'package:get/get.dart';

class HomeController extends GetxController {
  var is_fav = false.obs;

  changeFav() {
    if (is_fav.value) {
      is_fav.value = false;
    } else {
      is_fav.value = true;
    }
  }
}
