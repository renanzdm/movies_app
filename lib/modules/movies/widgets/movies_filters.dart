import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/movies/movies_controller.dart';

import 'filter_tag.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Row(
            children: controller.genres
                .map((element) => FilterTag(
                      genresModel: element,
                      onPressed:()=> controller.filterMoviesByGenre(element),
                      selected: controller.genreSelected.value?.id == element.id,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
