import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/ui/movies_app_icons_icons.dart';
import 'package:movies_app/app/ui/theme_extension.dart';
import 'package:movies_app/modules/favorites/favorite_page.dart';
import 'package:movies_app/modules/movies/movies_bindings.dart';
import 'package:movies_app/modules/movies/movies_page.dart';
import 'package:movies_app/modules/home/home_controller.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: controller.goToPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
            BottomNavigationBarItem(
                icon: Icon(MoviesAppIcons.heartEmpty), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: 'Exit')
          ],
          currentIndex: controller.pageIndex,
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
        );
      }),
      body: Navigator(
        key: Get.nestedKey(HomeController.navigatorKey),
        initialRoute: '/movies',
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
                settings: settings,
                page: () => const MoviesPage(),
                binding: MoviesBindings());
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
                settings: settings, page: () => const FavoritePage());
          }
          return null;
        },
      ),
    );
  }
}
