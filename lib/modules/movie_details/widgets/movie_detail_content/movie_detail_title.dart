import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:movies_app/app/ui/theme_extension.dart';
import 'package:movies_app/models/movie_details_model.dart';

class MovieDetailTitle extends StatelessWidget {
  final MovieDetailsModel? movie;

  const MovieDetailTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            movie?.title ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          RatingStars(
            valueLabelVisibility: false,
            value: movie?.stars ?? 1 / 2,
            starColor: context.themeOrange,
            starSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie?.genres.map((e) => e.name).join(',') ?? '',
            style: TextStyle(fontSize: 11, color: context.themeGrey),
          ),
        ],
      ),
    );
  }
}
