import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/ui/widgets/movie_card.dart';
import 'package:movies_app/modules/favorites/favorites_controller.dart';

class FavoritePage extends GetView<FavoritesController> {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Favorites'),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: controller.movies
                    .map((element) => MovieCard(
                        model: element,
                        favoriteCalback: () {
                          controller.removeFavorites(element);
                        }))
                    .toList(),
              ),
            ),
          );
        }));
  }
}
