import 'package:get/get.dart';
import 'package:movies_app/services/login/login_service.dart';

class HomeController extends GetxController {
  static const navigatorKey = 1;
  static const indexPageExit=2;
  final _pages = ['/movies','/favorites'];
  final _pageIndex = Rx<int>(0);
  int get pageIndex => _pageIndex.value;
  final LoginService _loginService;

  HomeController({required LoginService loginService}):_loginService=loginService;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == indexPageExit) {
      _loginService.logout();
    } else  {
      Get.offNamed(_pages[page], id: navigatorKey);
    }
  }
}
