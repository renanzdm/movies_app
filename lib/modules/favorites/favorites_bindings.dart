import 'package:get/get.dart';
import 'package:movies_app/modules/favorites/favorites_controller.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesController(
        authService: Get.find(), moviesService: Get.find()));
  }
}
