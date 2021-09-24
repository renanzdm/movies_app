import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/app/modules/modules.dart';
import 'package:movies_app/modules/login/login_bindings.dart';
import 'package:movies_app/modules/login/login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBindings()
    )
  ];
}
