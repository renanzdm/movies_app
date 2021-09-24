import 'package:movies_app/models/movie_model.dart';

abstract class MoviesService {
Future<List<MovieModel>> getPopularMovies();
Future<List<MovieModel>> getTopRated();
}