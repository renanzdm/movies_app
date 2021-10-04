import 'package:movies_app/models/cast_model.dart';
import 'package:movies_app/models/genres_model.dart';

class MovieDetailsModel {
  final String title;
  final double stars;
  final List<GenresModel> genres;
  final List<String> imagesUrl;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionsCompany;
  final String originalLanguage;
  final List<CastModel> cast;
  MovieDetailsModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.imagesUrl,
    required this.releaseDate,
    required this.overview,
    required this.productionsCompany,
    required this.originalLanguage,
    required this.cast,
  });

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPosters = map['images']['posters'];
    var urlImagesPath = urlImagesPosters
            ?.map<String>((image) =>
                'https://image.tmdb.org/t/p/w500${image['file_path']}')
            .toList() ??
        [];

    return MovieDetailsModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<GenresModel>.from(
          map['genres']?.map((x) => GenresModel.fromMap(x)) ?? const []),
      imagesUrl: urlImagesPath,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionsCompany:
          List<dynamic>.from(map['production_companies'] ?? const [])
              .map<String>((e) => e['name'])
              .toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
          map['credits']['cast']?.map((x) => CastModel.fromMap(x)) ?? const []),
    );
  }
}
