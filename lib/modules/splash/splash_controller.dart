import 'package:get/get.dart';
import 'package:movies_app/app/auth/auth_service.dart';

class SplashController extends GetxController {


@override
  Future<void> onReady() async {
    super.onReady();
    final authService = Get.find<AuthService>();
   await authService.init();
  }



}