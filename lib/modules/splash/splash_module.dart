import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/app/modules/modules.dart';
import 'package:movies_app/modules/splash/splash_bindings.dart';
import 'package:movies_app/modules/splash/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings()
    )
  ];
}
