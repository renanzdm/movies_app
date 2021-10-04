import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/modules/movie_details/movie_details_controller.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailsHeader extends GetView<MovieDetailsController> {
  final MovieDetailsModel? movie;
  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData = movie;
    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final image = movieData.imagesUrl[index];
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, image: image),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: movieData.imagesUrl.length,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
