import 'package:get/get.dart';
import 'package:movies_app/modules/home/home_controller.dart';
import 'package:movies_app/services/login/login_service.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(loginService: Get.find<LoginService>()),fenix: true);
  }
}