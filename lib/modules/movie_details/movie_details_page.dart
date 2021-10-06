import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/movie_details/widgets/movie_detail_content/movie_detail_content.dart';
import 'package:movies_app/modules/movie_details/widgets/movie_details_header.dart';
import './movie_details_controller.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieDetailsPage'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailsHeader(movie: controller.movieDetails.value),
              MovieDetailContent(movie: controller.movieDetails.value)
            ],
          ),
        );
      }),
    );
  }
}
