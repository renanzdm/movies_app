import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailsModel?> getDetails(int id);
}
