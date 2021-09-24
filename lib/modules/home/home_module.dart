import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/app/modules/modules.dart';
import 'package:movies_app/modules/home/home_bindings.dart';

import 'home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings()
    )
  ];
}
