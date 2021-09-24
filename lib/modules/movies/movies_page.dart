import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/movies/movies_controller.dart';
import 'package:movies_app/modules/movies/widgets/movies_filters.dart';
import 'package:movies_app/modules/movies/widgets/movies_group.dart';
import 'package:movies_app/modules/movies/widgets/movies_header.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children:  [
           const MoviesHeader(),
           const MoviesFilters(),
            MoviesGroup(title: 'Mais Populares',movies: controller.popularMovies,),
            MoviesGroup(title: 'Top Filmes',movies: controller.topRatedMovies,),
        ],
      ),
    );
  }
}
