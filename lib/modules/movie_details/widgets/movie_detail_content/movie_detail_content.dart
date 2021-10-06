import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/modules/movie_details/widgets/movie_detail_content/movie_detail_content_credits.dart';

import 'movie_detail_content_cast.dart';
import 'movie_detail_content_production_companies.dart';
import 'movie_detail_title.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailsModel? movie;

  const MovieDetailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailTitle(movie: movie),
        MovieDetailContentCredits(movie: movie),
        MovieDetailContentProductionCompanies(movie: movie),
        MovieDetailContentCast(movie: movie)
      ],
    );
  }
}
